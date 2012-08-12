class UserController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
  
  #creates a bookmarklet w/ unique id for each user. 
  def bookmarklet
    @script = "javascript:(function()%7Bmarkletid=" + current_user.id.to_s + ";document.body.appendChild(document.createElement('script')).src='http://localhost:3000/marklet.js';%7D)();"
  end
  
  #lists all bookmarks
  def all
    @results = []
    
    Bookmark.all.each do |b|
      entry = {url: b.url, title: b.title, user: b.user, name: b.user.name}
      @results.push(entry)
    end
  end

  #lists all of a user's bookmarks
  def index
    @user = params[:user]
    @results = []
    
    u = User.where(name: params[:user]).first
    u.bookmarks.each do |b|
      entry = {url: b.url, title: b.title, user: b.user, name: u.name}
      @results.push(entry)
    end
  end

end
