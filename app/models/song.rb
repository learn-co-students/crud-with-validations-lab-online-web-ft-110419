class Song < ApplicationRecord
    validates :title, presence: true
    validate :future_release_year
    validate :release_year_validation
    # validate :same_song_twice


    def release_year_validation
        if released == true && !release_year.present?
            errors.add(:release_year, "release year is required")
        end
    end

    def future_release_year
        if release_year.present? && release_year > Time.now.year
            errors.add(:release_year, "release year may not be in the future")
        end
    end

# is invalid if an artist tries to release the same song twice in a year (FAILED - 9)
# not yet working
    # def same_song_twice
    #     Song.all.each do |song|
    #         if song.release_year == :release_year && song.title == :title
    #             errors.add(:released, "can't release same song twice in a year")
    #         end
    #     end
    # end
end