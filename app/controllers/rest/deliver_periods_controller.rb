class Rest::DeliverPeriodsController < ApplicationController
  # GET /deliver_periods.json
  def index
    @deliver_periods = DeliverPeriod.all

    respond_to do |format|
      format.json { render :json => @deliver_periods }
    end
  end

  # GET /deliver_periods/1.json
  def show
    @deliver_period = DeliverPeriod.find(params[:id])

    respond_to do |format|
      format.json { render :json => @deliver_period }
    end
  end

end
