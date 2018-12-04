class VersionsController < ApplicationController
  def show
    @package = Package.find(params[:package_id])
    @version = Version.find(params[:id])
  end
end
