class Song < ActiveRecord::Base
    validates :title, :artist_name, :genre, presence: true
    validates :artist_name, uniqueness: { scope: %i[release_year artist_name], message: "This artist name has been taken"}
    with_options if: :set_released do |s|
        s.validates :release_year, presence: true
        s.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    def set_released
        released 
    end 
    
    
end
