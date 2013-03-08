class Rest::FetchersController < ApplicationController
  # GET /fetchers.json
  def index
    if params[:provider_id]
      @fetchers = Provider.find(params[:provider_id]).fetchers
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
