class SongsController < ApplicationController

    def index 
        @songs = Song.all 
    end 

    def show 
        @song = Song.find_by(params[:id])
    end

    def edit 
        @song = Song.find_by(params[:id])
    end 

    def new 
        @song = Song.new 
    end 

    def create 
        @song = Song.new(song_attr)
        if @song.save
            redirect_to song_path(@song)
        else 
            render :new
        end 
    end 

    def update
        @song = Song.find_by(params[:id])
        if @song.update(song_attr)
            redirect_to song_path(@song)
        else 
            render :edit 
        end 
    end 

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end 





    def song_attr
        params.require(:song).permit!
    end 
end
