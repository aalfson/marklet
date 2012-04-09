class BookmarkController < ApplicationController
protect_from_forgery

  def post
   
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
            
    # Rails.logger = Logger.new(STDOUT)
    #   logger.info params.inspect
    #   
    bookmark = Bookmark.create(url: params[:url], title: params[:title], user: params[:key]); 

    render :nothing => true
  end
  
  def index
    
    @msg = "Hello, World!"
    @bookmarks = Bookmark.all
    
  end
  
  def test
  end
    
end
