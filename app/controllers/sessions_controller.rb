class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  	  if user.email_confirmed   
        session[:user_id] = user.id   
        redirect_to articles_path 
      else
      	render :js => "alert('Please activate your account by following the'+ 
        'instructions in the account confirmation email you received to proceed');"
      end  
    else   
      render :new   
    end   
  end

  def destroy
  	session[:user_id] = nil   
    redirect_to root_path
  end
end
