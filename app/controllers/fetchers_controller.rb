class FetchersController < ApplicationController
  # GET /fetchers
  # GET /fetchers.json
  def index
    if params[:provider_id]
      @fetchers = Provider.find(params[:provider_id]).fetchers
    else
      @fetchers = Fetcher.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fetchers }
    end
  end

  # GET /fetchers/1
  # GET /fetchers/1.json
  def show
    @fetcher = Fetcher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fetcher }
    end
  end

  # GET /fetchers/new
  # GET /fetchers/new.json
  def new
    @fetcher = Fetcher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fetcher }
    end
  end

  # GET /fetchers/1/edit
  def edit
    @fetcher = Fetcher.find(params[:id])
  end

  # POST /fetchers
  # POST /fetchers.json
  def create
    @fetcher = Fetcher.new(params[:fetcher])

    respond_to do |format|
      if @fetcher.save
        format.html { redirect_to @fetcher, :notice => 'Fetcher was successfully created.' }
        format.json { render :json => @fetcher, :status => :created, :location => @fetcher }
      else
        format.html { render :action => "new" }
        format.json { render :json => @fetcher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fetchers/1
  # PUT /fetchers/1.json
  def update
    @fetcher = Fetcher.find(params[:id])

    respond_to do |format|
      if @fetcher.update_attributes(params[:fetcher])
        format.html { redirect_to @fetcher, :notice => 'Fetcher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fetcher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fetchers/1
  # DELETE /fetchers/1.json
  def destroy
    @fetcher = Fetcher.find(params[:id])
    @fetcher.destroy

    respond_to do |format|
      format.html { redirect_to fetchers_url }
      format.json { head :no_content }
    end
  end
end
