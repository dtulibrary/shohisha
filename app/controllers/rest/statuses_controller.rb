class Rest::StatusesController < ApplicationController
  # GET /statuses.json
  def index
    @statuses = Status.all

    respond_to do |format|
      format.json { render :json => @statuses }
    end
  end

  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.json { render :json => @status }
    end
  end

end
