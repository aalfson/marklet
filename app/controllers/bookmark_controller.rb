class BookmarkController < ApplicationController
  
  #handles bookmarklet request
  def post
    
    #cross-site scripting fix
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    
    u = User.find(params[:id])
    Bookmark.create(url: params[:url], title: params[:title], user: u); 

    render :nothing => true
  end
  
  #lists all bookmarks - does not require user authentication
  def index
    @results = []
    
    Bookmark.all.each do |b|
      user_url = "/" + b.user.name
      entry = {url: b.url, title: b.title, user: b.user, name: b.user.name, user_url: user_url }
      @results.push(entry)
    end
  end
  
  #lists all of a user's bookmarks
  def user_index
    @user = params[:user]
    @results = []
    
    u = User.where(name: params[:user]).first
    u.bookmarks.each do |b|
      user_url = "/" + u.name
      entry = {url: b.url, title: b.title, user: b.user, name: u.name, user_url: user_url}
      @results.push(entry)
    end
  end
    
end
