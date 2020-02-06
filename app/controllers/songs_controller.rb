class SongsController < ApplicationController
    before_action :find_song, only: [:show, :create, :edit, :update, :destroy]
    def index
        @songs = Song.all
    end 

    def show 
    end 

    def new 
        @song = Song.new
    end 

    def create 
        @song = Song.create(params_set)
        if @song.valid?
            redirect_to song_path(@song)
        else 
            render :new
        end 
    end 

    def edit 
    end

    def update
        @song.update(params_set)
        if @song.valid?
            redirect_to song_path(@song)
        else 
            render :edit
        end
    end 

    def destroy 
        @song.delete
        redirect_to songs_path
    end 

    private 

    def find_song
        @song = Song.find_by_id(params[:id])
    end 

    def params_set 
        params.require("song").permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
