class Rest::TransportsController < ApplicationController
  # GET /transports.json
  def index
    @transports = Transport.all

    respond_to do |format|
      format.json { render :json => @transports }
    end
  end

  # GET /transports/1.json
  def show
    @transport = Transport.find(params[:id])

    respond_to do |format|
      format.json { render :json => @transport }
    end
  end

end
