class ConsumersController < ApplicationController
  def index
    @consumers = Consumer.all
  end

  def show
    @consumer = Consumer.find(params[:id])
  end

end
