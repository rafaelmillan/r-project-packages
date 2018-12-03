require "rails_helper"

describe Indexer do
  describe "#create_index" do
    before(:all) do
      Indexer.new.create_index
    end

    it "indexes all packages" do
      expect(Package.count).to eq(3)
    end

    it "creates a Package and its Version records" do
      expect(Package.find_by("rafalib").name).to eq("rafalib")
    end

    it "indexes all the Version attributes" do
      version = Package.find_by("rafalib").latest_version

      expect(version.number).to eq("1.0.0")
      expect(version.date_publication).to eq(DateTime.parse("2015-08-09 00:00:40"))
      expect(version.title).to eq("Convenience Functions for Routine Data Exploration")
      expect(version.description).to eq("A series of shortcuts for routine tasks originally developed by Rafael A. Irizarry to facilitate data exploration.")
      expect(version.author).to eq("Rafael A. Irizarry and Michael I. Love")
      expect(version.maintainers).to eq("Rafael A. Irizarry <rafa@jimmy.harvard.edu>")
    end
  end

  describe "#refresh_index" do
    before(:all) do
      indexer = Indexer.new

      indexer.create_index
      indexer.refresh_index
    end

    it "updates new packages" do
      version = Package.find_by("rafalib").latest_version

      expect(version.number).to eq("1.0.1")
      expect(version.description).to eq("A new and better description")
    end
  end
end
