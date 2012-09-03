class CategoryController < ApplicationController
  
  def create
    
   name = params[:name]
   description = params[:description]
    
   if (user_signed_in? == false)
     redirect_to :new_session
   elsif Category.where(name: name).empty? == false
     redirect_to '/c/' + name
   else   
     c = Category.create(name: name, description: description, users: [current_user], owner: current_user)
     redirect_to '/c/' + name 
   end
  end
  
  def new
  end
  
end
