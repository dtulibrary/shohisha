class Rest::ProviderTypesController < ApplicationController
  # GET /provider_types.json
  def index
    @provider_types = ProviderType.all

    respond_to do |format|
      format.json { render json: @provider_types }
    end
  end

  # GET /provider_types/1.json
  def show
    @provider_type = ProviderType.find(params[:id])

    respond_to do |format|
      format.json { render json: @provider_type }
    end
  end

end
