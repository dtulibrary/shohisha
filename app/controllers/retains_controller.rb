class RetainsController < ApplicationController
  # GET /retains
  # GET /retains.json
  def index
    @retains = Retain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @retains }
    end
  end

  # GET /retains/1
  # GET /retains/1.json
  def show
    @retain = Retain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @retain }
    end
  end

  # GET /retains/new
  # GET /retains/new.json
  def new
    @retain = Retain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @retain }
    end
  end

  # GET /retains/1/edit
  def edit
    @retain = Retain.find(params[:id])
  end

  # POST /retains
  # POST /retains.json
  def create
    @retain = Retain.new(params[:retain])

    respond_to do |format|
      if @retain.save
        format.html { redirect_to @retain, :notice => 'Retain was successfully created.' }
        format.json { render :json => @retain, :status => :created, :location => @retain }
      else
        format.html { render :action => "new" }
        format.json { render :json => @retain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /retains/1
  # PUT /retains/1.json
  def update
    @retain = Retain.find(params[:id])

    respond_to do |format|
      if @retain.update_attributes(params[:retain])
        format.html { redirect_to @retain, :notice => 'Retain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @retain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /retains/1
  # DELETE /retains/1.json
  def destroy
    @retain = Retain.find(params[:id])
    @retain.destroy

    respond_to do |format|
      format.html { redirect_to retains_url }
      format.json { head :no_content }
    end
  end
end
