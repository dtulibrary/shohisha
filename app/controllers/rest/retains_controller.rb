class Rest::RetainsController < ApplicationController
  # GET /retains.json
  def index
    @retains = Retain.all

    respond_to do |format|
      format.json { render :json => @retains }
    end
  end

  # GET /retains/1.json
  def show
    @retain = Retain.find(params[:id])

    respond_to do |format|
      format.json { render :json => @retain }
    end
  end

end
