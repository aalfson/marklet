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
  
  #lists all bookmarks
  def index
    @results = []
    
    Bookmark.all.each do |b|
      entry = {url: b.url, title: b.title, user: b.user, name: User.find(b.user).name}
      @results.push(entry)
    end
  end
    
end
