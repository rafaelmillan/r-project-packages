require "open-uri"
require "dcf"
require 'rubygems/package'
require 'zlib'

class Indexer
  CRAN_URL = "http://cran.r-project.org/src/contrib"

  def create_index
    Rails.logger.info "Downloading packages"

    raw_packages.sample(60).each do |raw_package|
      package = Package.new(name: raw_package["Package"])
      version = package.build_latest_version(number: raw_package["Version"], package: package)

      Rails.logger.info "Downloading #{package.name}"

      raw_description = raw_description(package, version)

      version.date_publication = DateTime.parse(raw_description["Date/Publication"])
      version.title = raw_description["Title"]
      version.description = raw_description["Description"]
      version.author = raw_description["Author"]
      version.maintainers = raw_description["Maintainer"]

      package.save!
    rescue TypeError, OpenURI::HTTPError
      Rails.logger.info "Can't index #{package.name}"
    end
  end

  private

  def raw_packages
    @packages ||= Dcf.parse(open("#{CRAN_URL}/PACKAGES").read)
  end

  def raw_description(package, version)
    description_file = open("#{CRAN_URL}/#{package.name}_#{version.number}.tar.gz")
    tar = Gem::Package::TarReader.new(Zlib::GzipReader.open(description_file))

    description_hash = nil

    tar.seek("#{package.name}/DESCRIPTION") do |file|
      description_hash = Dcf.parse(file.read).first
    end

    tar.close

    description_hash
  end
end
