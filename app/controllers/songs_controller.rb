class SongsController < ApplicationController

    before_action :find_song, only: [:show, :update, :destroy, :edit]
    
    def find_song
        @song = Song.find_by_id(params[:id])
    end 
    
    def index
        @songs = Song.all
    end


    def new
        @song = Song.new
    end 

    def show
    end 

    def create
        @song = Song.new(params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre))
        if @song.save 
            redirect_to song_path(@song)
        else
            render :new
        end 
    end 

    def edit 
        render :edit 
    end 

    def update
        if @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
            redirect_to song_path(@song)
        else 
            render :edit 
        end 
    end
    
    def destroy
        @song.destroy
        redirect_to songs_url
    end 

    
end
    
    



