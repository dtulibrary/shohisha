class Rest::IpaddressesController < ApplicationController
  # GET /ipaddresses.json
  def index
    @ipaddresses = Ipaddress.all

    respond_to do |format|
      format.json { render :json => @ipaddresses }
    end
  end

  # GET /ipaddresses/1.json
  def show
    @ipaddress = Ipaddress.find(params[:id])

    respond_to do |format|
      format.json { render :json => @ipaddress }
    end
  end

end
