class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, exclusion: { in: [nil] }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, presence: true, if: :released?
  validates :artist_name, presence: true, format: { with: /[a-z]+/i }
end
