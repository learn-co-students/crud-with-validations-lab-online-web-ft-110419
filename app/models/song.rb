class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validates :release_year, presence: true, if: :released?
    validate :not_in_future
    validates :artist_name, presence: true

    def not_in_future
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "can't be in the past")
        end
    end
end
