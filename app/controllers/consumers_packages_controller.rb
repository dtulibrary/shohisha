class ConsumersPackagesController < ApplicationController
  # GET /consumers_packages.json
  def index
    @consumers_packages = ConsumersPackage.all

    respond_to do |format|
      format.json { render :json => @consumers_packages }
    end
  end

  # GET /consumers_packages/1.json
  def show
    @consumers_package = ConsumersPackage.find(params[:id])

    respond_to do |format|
      format.json { render :json => @consumers_package }
    end
  end

  # POST /consumers_packages.json
  def create
    @consumers_package = ConsumersPackage.new(params[:consumers_package])

    respond_to do |format|
      if @consumers_package.save
        format.json { render :json => @consumers_package, :status => :created, :location => @consumers_package }
      else
        format.json { render :json => @consumers_package.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consumers_packages/1.json
  def update
    @consumers_package = ConsumersPackage.find(params[:id])

    respond_to do |format|
      if @consumers_package.update_attributes(params[:consumers_package])
        format.json { head :no_content }
      else
        format.json { render :json => @consumers_package.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consumers_packages/1.json
  def destroy
    @consumers_package = ConsumersPackage.find(params[:id])
    @consumers_package.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
