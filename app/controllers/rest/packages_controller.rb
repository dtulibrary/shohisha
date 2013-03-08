class Rest::PackagesController < ApplicationController
  # GET /packages.json
  def index
    if (params[:provider_id]) then
      @packages = Provider.find(params[:provider_id]).packages
    elsif params[:consumer_id]
      @packages = Consumer.find(params[:consumer_id]).packages
    else
      @packages = Package.all
    end

    respond_to do |format|
      format.json { render :json => @packages }
    end
  end

  # GET /packages/1.json
  def show
    @package = Package.find(params[:id])

    respond_to do |format|
      format.json { render :json => @package }
    end
  end

end
