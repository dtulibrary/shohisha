class Rest::ConsumersController < ApplicationController
  # GET /consumers.json
  def index
    if params[:package_id]
      @consumers = Package.find(params[:package_id]).consumers
    elsif params[:provider_id]
      @consumers = Provider.find(params[:provider_id]).consumers
    else
      @consumers = Consumer.all
    end

    respond_to do |format|
      format.json { render :json => @consumers }
    end
  end

  # GET /consumers/1.json
  def show
    @consumer = Consumer.find(params[:id])

    respond_to do |format|
      format.json { render :json => @consumer }
    end
  end

end
