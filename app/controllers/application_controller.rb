class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_admin_user!
    #if 
    #current_user =
    #unless current_user.admin?
    #  flash[:alert] = I18n.t("shohisha.admin")
    #  redirect_to root_path
    #end
  end

end
