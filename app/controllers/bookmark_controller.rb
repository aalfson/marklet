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
    
end
