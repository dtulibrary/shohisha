class Rest::UsersController < ApplicationController
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.json { render :json => @user }
    end
  end

end
