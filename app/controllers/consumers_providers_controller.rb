class ConsumersProvidersController < ApplicationController
  # GET /consumers_providers.json
  def index
    @consumers_providers = ConsumersProvider.all

    respond_to do |format|
      format.json { render :json => @consumers_providers }
    end
  end

  # GET /consumers_providers/1.json
  def show
    @consumers_provider = ConsumersProvider.find(params[:id])

    respond_to do |format|
      format.json { render :json => @consumers_provider }
    end
  end

  # POST /consumers_providers.json
  def create
    @consumers_provider = ConsumersProvider.new(params[:consumers_provider])

    respond_to do |format|
      if @consumers_provider.save
        format.json { render :json => @consumers_provider, :status => :created, :location => @consumers_provider }
      else
        format.json { render :json => @consumers_provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consumers_providers/1.json
  def update
    @consumers_provider = ConsumersProvider.find(params[:id])

    respond_to do |format|
      if @consumers_provider.update_attributes(params[:consumers_provider])
        format.json { head :no_content }
      else
        format.json { render :json => @consumers_provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumers_providers/1.json
  def destroy
    @consumers_provider = ConsumersProvider.find(params[:id])
    @consumers_provider.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
