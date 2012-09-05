class ProviderTypesController < ApplicationController
  # GET /provider_types
  # GET /provider_types.json
  def index
    @provider_types = ProviderType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @provider_types }
    end
  end

  # GET /provider_types/1
  # GET /provider_types/1.json
  def show
    @provider_type = ProviderType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @provider_type }
    end
  end

  # GET /provider_types/new
  # GET /provider_types/new.json
  def new
    @provider_type = ProviderType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @provider_type }
    end
  end

  # GET /provider_types/1/edit
  def edit
    @provider_type = ProviderType.find(params[:id])
  end

  # POST /provider_types
  # POST /provider_types.json
  def create
    @provider_type = ProviderType.new(params[:provider_type])

    respond_to do |format|
      if @provider_type.save
        format.html { redirect_to @provider_type, notice: 'Provider type was successfully created.' }
        format.json { render json: @provider_type, status: :created, location: @provider_type }
      else
        format.html { render action: "new" }
        format.json { render json: @provider_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /provider_types/1
  # PUT /provider_types/1.json
  def update
    @provider_type = ProviderType.find(params[:id])

    respond_to do |format|
      if @provider_type.update_attributes(params[:provider_type])
        format.html { redirect_to @provider_type, notice: 'Provider type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @provider_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_types/1
  # DELETE /provider_types/1.json
  def destroy
    @provider_type = ProviderType.find(params[:id])
    @provider_type.destroy

    respond_to do |format|
      format.html { redirect_to provider_types_url }
      format.json { head :no_content }
    end
  end
end
