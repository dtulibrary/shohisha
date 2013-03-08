class Rest::ConsumersPackagesController < ApplicationController
  # GET /consumers_packages.json
  def index
    if params[:consumer_id]
      @consumers_packages = ConsumersPackage.where(:consumer_id => params[:consumer_id])
    elsif params[:package_id]
      @consumers_packages = ConsumersPackage.where(:package_id => params[:package_id])
    else
      @consumers_packages = ConsumersPackage.all
    end

    respond_to do |format|
      format.json { render :json => @consumers_packages }
    end
  end

  # GET /consumers_packages/1.json
  def show
    @consumers_packages = ConsumersPackage.find(params[:id])

    respond_to do |format|
      format.json { render :json => @consumers_packages }
    end
  end

end
