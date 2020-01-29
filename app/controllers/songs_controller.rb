class SongsController < ApplicationController
	def index
		@songs = Song.all
	end
	def show 
		@song = Song.find_by_id(params[:id])
	end
	def new
		@song = Song.new
	end 
	def create
		@song = Song.new(params.require(:song).permit(:release_year, :title, :artist_name, :released, :genre))
		if @song.save 
			redirect_to song_path(@song)
		else
			render :'songs/new'
		end
	end
	def edit
		@song = Song.find_by_id(params[:id])
	end 
	def update
		@song = Song.find_by_id(params[:id])
		if @song.update(params.require(:song).permit(:release_year, :title, :artist_name, :released, :genre))
			redirect_to song_path(@song)
		else
			render :'songs/edit'
		end
	end

	def destroy
		@song = Song.find_by_id(params[:id])
		@song.destroy
		redirect_to songs_path
	end

end
