class AddIndexTitleArtistYearToSongs < ActiveRecord::Migration[5.0]
  def change
    add_index :songs, [:title, :release_year, :artist_name], unique: true
  end
end
