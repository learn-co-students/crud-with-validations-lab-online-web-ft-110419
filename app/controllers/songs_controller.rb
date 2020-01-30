class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(songs_params)

    if @song.valid?
      @song.save

      redirect_to @song
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  
    if @song.update(songs_params)
      redirect_to @song
    else
      render :edit      
    end
  end

  def destroy
    set_song.destroy
    redirect_to songs_path
  end
  private

  def songs_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end

  def set_song
    @song = Song.find_by_id(params[:id])
  end
end
