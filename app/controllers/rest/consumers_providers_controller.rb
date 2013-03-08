class Rest::ConsumersProvidersController < ApplicationController
  # GET /consumers_providers.json
  def index
    if params[:consumer_id]
      @consumers_providers = ConsumersProvider.where(:consumer_id => params[:consumer_id])
    elsif params[:provider_id]
      @consumers_providers = ConsumersProvider.where(:provider_id => params[:provider_id])
    else
      @consumers_providers = ConsumersProvider.all
    end

    respond_to do |format|
      format.json { render :json => @consumers_providers }
    end
  end

  # GET /consumers_providers/1.json
  def show
    @consumers_providers = ConsumersProvider.find(params[:id])

    respond_to do |format|
      format.json { render :json => @consumers_providers }
    end
  end

end
