class SessionsController < ApplicationController

  def create
  		user = User.find_by_email(params[:email])

	   if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
	        redirect_to "/songs"
	   else
	     flash[:email_error] = "Invalid Email"
	     flash[:password] = "Invalid password"
	     redirect_to '/'
	   end
  end
  def destroy

		session[:user_id] = false

		redirect_to "/"
	end

end
