class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def get_categories
    
    @categories = []
    
    if current_user != nil
      @categories = current_user.categories
    else
      @categories = Categories.twenty_most_popular
    end
    
  end
end
