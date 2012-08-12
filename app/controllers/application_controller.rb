class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #devise after-registration redirect
  def after_sign_up_path_for(resource)
    bookmarklet_url(user: current_user.name) # <- Path you want to redirect the user to after signup
  end
end
