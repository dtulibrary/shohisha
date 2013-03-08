class Rest::FulltextsController < ApplicationController
  # GET /fulltexts.json
  def index
    @fulltexts = Fulltext.all

    respond_to do |format|
      format.json { render :json => @fulltexts }
    end
  end

  # GET /fulltexts/1.json
  def show
    @fulltext = Fulltext.find(params[:id])

    respond_to do |format|
      format.json { render :json => @fulltext }
    end
  end

end
