class Rest::SuppliesController < ApplicationController
  # GET /supplies.json
  def index
    @supplies = Supply.all

    respond_to do |format|
      format.json { render :json => @supplies }
    end
  end

  # GET /supplies/1.json
  def show
    @supply = Supply.find(params[:id])

    respond_to do |format|
      format.json { render :json => @supply }
    end
  end

end
