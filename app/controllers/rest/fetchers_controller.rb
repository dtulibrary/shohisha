class Rest::FetchersController < ApplicationController
  # GET /fetchers.json
  def index
    if params[:provider_id]
      @fetchers = Fetcher.where(:provider_id => params[:provider_id])
    elsif params[:supply_id]
      @fetchers = Fetcher.where(:supply_id => params[:supply_id])
    elsif params[:retain_id]
      @fetchers = Fetcher.where(:retain_id => params[:retain_id])
    elsif params[:transport_id]
      @fetchers = Fetcher.where(:transport_id => params[:transport_id])
    elsif params[:deliver_period_id]
      @fetchers = Fetcher.where(:deliver_period_id => params[:deliver_period_id])
    elsif params[:status_id]
      @fetchers = Fetcher.where(:status_id => params[:status_id])
    else
      @fetchers = Fetcher.all
    end

    respond_to do |format|
      format.json { render :json => @fetchers }
    end
  end

  # GET /fetchers/1.json
  def show
    @fetcher = Fetcher.find(params[:id])

    respond_to do |format|
      format.json { render :json => @fetcher }
    end
  end

end
