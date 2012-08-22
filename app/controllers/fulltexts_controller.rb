class FulltextsController < ApplicationController
  # GET /fulltexts
  # GET /fulltexts.json
  def index
    @fulltexts = Fulltext.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fulltexts }
    end
  end

  # GET /fulltexts/1
  # GET /fulltexts/1.json
  def show
    @fulltext = Fulltext.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fulltext }
    end
  end

  # GET /fulltexts/new
  # GET /fulltexts/new.json
  def new
    @fulltext = Fulltext.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fulltext }
    end
  end

  # GET /fulltexts/1/edit
  def edit
    @fulltext = Fulltext.find(params[:id])
  end

  # POST /fulltexts
  # POST /fulltexts.json
  def create
    @fulltext = Fulltext.new(params[:fulltext])

    respond_to do |format|
      if @fulltext.save
        format.html { redirect_to @fulltext, :notice => 'Fulltext was successfully created.' }
        format.json { render :json => @fulltext, :status => :created, :location => @fulltext }
      else
        format.html { render :action => "new" }
        format.json { render :json => @fulltext.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fulltexts/1
  # PUT /fulltexts/1.json
  def update
    @fulltext = Fulltext.find(params[:id])

    respond_to do |format|
      if @fulltext.update_attributes(params[:fulltext])
        format.html { redirect_to @fulltext, :notice => 'Fulltext was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fulltext.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fulltexts/1
  # DELETE /fulltexts/1.json
  def destroy
    @fulltext = Fulltext.find(params[:id])
    @fulltext.destroy

    respond_to do |format|
      format.html { redirect_to fulltexts_url }
      format.json { head :no_content }
    end
  end
end
