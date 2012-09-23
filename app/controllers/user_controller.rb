class UserController < ApplicationController
  before_filter :authenticate_user!
  
  #creates a bookmarklet w/ unique id for each user. 
  def bookmarklet
    @script = "javascript:(function()%7Bmarkletid=" + current_user.id.to_s + ";document.body.appendChild(document.createElement('script')).src='http://marklet.herokuapp.com/marklet.js';%7D)();"
  end

end
