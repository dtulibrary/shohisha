class ProvidersController < ApplicationController
  # GET /providers
  # GET /providers.json
  def index
    if params[:fetcher_id]
      @providers = Fetcher.find(params[:fetcher_id]).providers
    elsif params[:consumer_id]
      @providers = Consumer.find(params[:consumer_id]).providers
    else
      @providers = Provider.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @providers }
    end
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @provider = Provider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @provider }
    end
  end

  # GET /providers/new
  # GET /providers/new.json
  def new
    @provider = Provider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @provider }
    end
  end

  # GET /providers/1/edit
  def edit
    @provider = Provider.find(params[:id])
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(params[:provider])

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, :notice => 'Provider was successfully created.' }
        format.json { render :json => @provider, :status => :created, :location => @provider }
      else
        format.html { render :action => "new" }
        format.json { render :json => @provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /providers/1
  # PUT /providers/1.json
  def update
    @provider = Provider.find(params[:id])

    respond_to do |format|
      if @provider.update_attributes(params[:provider])
        format.html { redirect_to @provider, :notice => 'Provider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy

    respond_to do |format|
      format.html { redirect_to providers_url }
      format.json { head :no_content }
    end
  end

  def code
    @provider = Provider.find_by_code(params[:code])

    respond_to do |format|
      format.html { render "show" }
      format.json { render :json => @provider }
      format.text { render :text => @provider.id }
    end
  end

end
