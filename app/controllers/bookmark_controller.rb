class BookmarkController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:update, :delete]
  
  #handles bookmarklet post request
  def create
    
    #cross-site scripting fix
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    
    u = User.find(params[:id])
    b = Bookmark.where(url: params[:url], user_id: u).first
    
    #ensure user does not submit a link more than once
    if b == nil
     Bookmark.create(url: params[:url], title: params[:title], user: u);  
    end

    render :nothing => true
  end
  
  #lists all bookmarks - does not require user authentication
  def index
    @results = []
    
    Bookmark.all.each do |b|
      user_url = "/" + b.user.name
      entry = {id: b.id, url: b.url, title: b.title, user: b.user, name: b.user.name, user_url: user_url }
      @results.push(entry)
    end
  end
  
  def category_index
    @name = params[:category]
    
    category = Category.where(name: @name)
    
    #get bookmarks
    if category.empty? || category == nil
      redirect_to :root
    else
      category = category[0]
      @results = []

       category.bookmarks.each do |b|
         user_url = "/" + b.user.name
         entry = {id: b.id, url: b.url, title: b.title, user: b.user, name: b.user.name, user_url: user_url }
         @results.push(entry)  
       end
    end
    
    #check to see if user is moderator
    if user_signed_in? && category.moderator?(current_user)
      @is_moderator = true
    end
     
  end

  #lists all of a user's bookmarks
  def user_index
    @user = params[:user]
    @results = []
    
    u = User.where(name: params[:user]).first
    
    if u == nil
      redirect_to :root
    else      
      u.bookmarks.each do |b|
        user_url = "/" + u.name
        entry = {id: b.id, url: b.url, title: b.title, user: b.user, name: u.name, user_url: user_url}
        @results.push(entry)
      end
    end
  end

  def update_bookmark_form
    begin
      @bookmark = Bookmark.find(params[:id])
    rescue
      redirect_to :root, :flash => {error: "There was a problem with the page you requested."}
    end
  end
  
  #updates bookmark
  def update  
    
    begin
      bookmark = Bookmark.find(params[:id])
      
      #Only the title and url attributes are updateable. 
      if bookmark.user == current_user
        bookmark.update_attributes(url: params[:url], title: params[:title])
        redirect_to '/' + current_user.name
      end
    rescue
      redirect_to :root, :flash => {error: "Could not update the bookmark."}
    end
    
  end
  
  #deletes bookmark
  def delete

      id = params[:id]
      
      #look for bookmark, throw 500 error if not found
      begin
        bookmark = Bookmark.find(id)
      rescue
       respond_to do |format|
          response.status = 500
          format.json { render :json => "Could not process request." }
        end
      end    
      
      #delete bookmark if it belongs to the current user
      if bookmark
        user = bookmark.user
    
        if user == current_user
           bookmark.destroy
        end
        
        respond_to do |format|
          format.json { render :json => bookmark.id }
        end
      end
  end
end
