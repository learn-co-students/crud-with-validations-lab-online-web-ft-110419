class Song < ActiveRecord::Base
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true,false]  }
    with_options if: :released do |released|
        released.validates :release_year, presence: true
        released.validates :release_year, length: { is: 4 }
        released.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }
    end
end
