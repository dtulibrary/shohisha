class Rest::ProvidersController < ApplicationController
  # GET /providers.json
  def index
    if params[:fetcher_id]
      @providers = [Fetcher.find(params[:fetcher_id]).provider]
    elsif params[:consumer_id]
      @providers = Consumer.find(params[:consumer_id]).providers
    elsif params[:package_id]
      @providers = [Package.find(params[:package_id]).provider]
    elsif params[:provider_type_id]
      @providers = Provider.where(:provider_type_id => params[:provider_type_id])
    else
      @providers = Provider.all
    end

    respond_to do |format|
      format.json { render :json => @providers }
    end
  end

  # GET /providers/1.json
  def show
    @provider = Provider.find(params[:id])

    respond_to do |format|
      format.json { render :json => @provider }
    end
  end

  # GET /providercode/code.json
  # GET /providercode/code.text
  def code
    @provider = Provider.find_by_code(params[:code])

    respond_to do |format|
      format.json { render :json => @provider }
      format.text { render :text => @provider.id }
    end
  end

end
