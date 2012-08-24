class DeliverPeriodsController < ApplicationController
  # GET /deliver_periods
  # GET /deliver_periods.json
  def index
    @deliver_periods = DeliverPeriod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @deliver_periods }
    end
  end

  # GET /deliver_periods/1
  # GET /deliver_periods/1.json
  def show
    @deliver_period = DeliverPeriod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @deliver_period }
    end
  end

  # GET /deliver_periods/new
  # GET /deliver_periods/new.json
  def new
    @deliver_period = DeliverPeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @deliver_period }
    end
  end

  # GET /deliver_periods/1/edit
  def edit
    @deliver_period = DeliverPeriod.find(params[:id])
  end

  # POST /deliver_periods
  # POST /deliver_periods.json
  def create
    @deliver_period = DeliverPeriod.new(params[:deliver_period])

    respond_to do |format|
      if @deliver_period.save
        format.html { redirect_to @deliver_period, :notice => 'Deliver period was successfully created.' }
        format.json { render :json => @deliver_period, :status => :created, :location => @deliver_period }
      else
        format.html { render :action => "new" }
        format.json { render :json => @deliver_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deliver_periods/1
  # PUT /deliver_periods/1.json
  def update
    @deliver_period = DeliverPeriod.find(params[:id])

    respond_to do |format|
      if @deliver_period.update_attributes(params[:deliver_period])
        format.html { redirect_to @deliver_period, :notice => 'Deliver period was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @deliver_period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deliver_periods/1
  # DELETE /deliver_periods/1.json
  def destroy
    @deliver_period = DeliverPeriod.find(params[:id])
    @deliver_period.destroy

    respond_to do |format|
      format.html { redirect_to deliver_periods_url }
      format.json { head :no_content }
    end
  end
end
