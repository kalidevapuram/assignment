class SongsController < ApplicationController
	def index
		@user = User.find_by_id(session[:user_id])
		@all_users = User.all
		@all_songs = Song.all
		
	end

	def create
		@song = Song.create song_params
		   	
			if @song.save
				redirect_to "/songs"
		   else
		     	flash[:songs_error] = @song.errors.full_messages
		     	redirect_to "/songs"
			end
	end

	def show

		@user = User.find_by_id(session[:user_id])
  		@song = Song.find_by_id(params[:id])
  		@count = Count.where(song_id: params[:id])
  		puts "*******"
  		puts @count
	end

	

	private

	def song_params
		params.require(:song).permit(:title, :artist).merge(user: current_user)
	end
end
