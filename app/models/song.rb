class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: {
        scope: %i[release_year artist_name], 
        message: 'cannot be repeated by the same artist in the same year'
    }
    validates :released, inclusion: {in: [true, false]}
    

    with_options if: :released? do |released|
        released.validates :release_year, presence: true 
        released.validates :release_year, length: {is: 4}
        released.validates :release_year, numericality: {only_integer: true, less_than_or_equal_to: Time.now.year}
    end 




 
end
# Optional if released is false
# Must not be blank if released is true
# Must be less than or equal to the current year
