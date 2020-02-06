class Song < ApplicationRecord
    validates  :title, presence: true
    validates  :title, uniqueness: true
    validates  :released, inclusion: { in: [true, false] }
    validates  :artist_name, presence: true
    validates  :released, presence: true, if: :released
    validates  :release_year, numericality: { only_integer: true , less_than_or_equal_to: Time.now.year}, if: :released
    
end
