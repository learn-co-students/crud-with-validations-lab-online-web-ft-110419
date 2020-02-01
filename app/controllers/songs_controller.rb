class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.new(song_params(:title, :artist_name, :release_year, :released, :genre))

        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
    @song = Song.find(params[:id])
    @song.assign_attributes(song_params(:title, :artist_name, :release_year, :released, :genre))

        if @song.valid?
            @song.update(song_params(:title, :artist_name, :release_year, :released, :genre))
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

    private 

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end