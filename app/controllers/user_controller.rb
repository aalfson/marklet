class UserController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  
  #creates a bookmarklet w/ unique id for each user. 
  def script
    @script = "javascript:(function()%7Bdocument.body.appendChild(document.createElement('script')).src='http://localhost:3000/marklet.js';%7D)(" + current_user.id.to_s + ");"
  end
  
end
