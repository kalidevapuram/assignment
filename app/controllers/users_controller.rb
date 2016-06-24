class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
  		@user = User.new user_params
	   if @user.save
	   		session[:user_id] = @user.id
	   		redirect_to "/songs"
	   else
	     flash[:register_error] = @user.errors.full_messages
	     redirect_to "/"
		end
  end


  def show
  	@user = User.find_by_id(params[:id] )
  	@songs_added_by_user  = Count.where(user_id: params[:id] )
  	@songs = Count.all

  end

  private
   	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
