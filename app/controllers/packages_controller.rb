class PackagesController < ApplicationController
  def index
    @packages = Package.includes(:latest_version).order("LOWER(name)").all
  end
end
