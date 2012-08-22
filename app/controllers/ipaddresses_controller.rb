class IpaddressesController < ApplicationController
  # GET /ipaddresses
  # GET /ipaddresses.json
  def index
    @ipaddresses = Ipaddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @ipaddresses }
    end
  end

  # GET /ipaddresses/1
  # GET /ipaddresses/1.json
  def show
    @ipaddress = Ipaddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @ipaddress }
    end
  end

  # GET /ipaddresses/new
  # GET /ipaddresses/new.json
  def new
    @ipaddress = Ipaddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @ipaddress }
    end
  end

  # GET /ipaddresses/1/edit
  def edit
    @ipaddress = Ipaddress.find(params[:id])
  end

  # POST /ipaddresses
  # POST /ipaddresses.json
  def create
    @ipaddress = Ipaddress.new(params[:ipaddress])

    respond_to do |format|
      if @ipaddress.save
        format.html { redirect_to @ipaddress, :notice => 'Ipaddress was successfully created.' }
        format.json { render :json => @ipaddress, :status => :created, :location => @ipaddress }
      else
        format.html { render :action => "new" }
        format.json { render :json => @ipaddress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ipaddresses/1
  # PUT /ipaddresses/1.json
  def update
    @ipaddress = Ipaddress.find(params[:id])

    respond_to do |format|
      if @ipaddress.update_attributes(params[:ipaddress])
        format.html { redirect_to @ipaddress, :notice => 'Ipaddress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @ipaddress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ipaddresses/1
  # DELETE /ipaddresses/1.json
  def destroy
    @ipaddress = Ipaddress.find(params[:id])
    @ipaddress.destroy

    respond_to do |format|
      format.html { redirect_to ipaddresses_url }
      format.json { head :no_content }
    end
  end
end
