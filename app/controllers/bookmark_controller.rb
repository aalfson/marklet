class BookmarkController < ApplicationController
protect_from_forgery

  def post
    #cross-site request fix
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
            
    bookmark = Bookmark.create(url: params[:url], title: params[:title], user: params[:key]); 

    render :nothing => true
  end
  
  def index
    @bookmarks = Bookmark.all
  end
  
  def test
  end
    
end
