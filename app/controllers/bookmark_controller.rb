class BookmarkController < ApplicationController
  
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
     category = Category.where(name: @name).first
     @results = []
     
     category.bookmarks.each do |b|
       user_url = "/" + b.user.name
       entry = {id: b.id, url: b.url, title: b.title, user: b.user, name: b.user.name, user_url: user_url }
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
      entry = {id: b.id, url: b.url, title: b.title, user: b.user, name: u.name, user_url: user_url}
      @results.push(entry)
    end
  end

  def update_bookmark_form
    begin
      @bookmark = Bookmark.find(params[:id])
    rescue
      redirect_to :root
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
      redirect_to :root
    end
    
  end
  
  #deletes bookmark
  def delete
    
    begin
      id = params[:id]
      bookmark = Bookmark.find(id)
      user = bookmark.user
    
      #find bookmark, check to ensure it belongs to user, then delete it. 
      if user == current_user
         bookmark.destroy
      end
      
      redirect_to :back
    rescue
      redirect_to :root
    end
  end
end
