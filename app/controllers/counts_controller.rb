class CountsController < ApplicationController
	def create
		song = Song.find(params[:id])
    	counts = Count.create(user: current_user, song: song)
    	redirect_to "/songs"
	end
	
end
