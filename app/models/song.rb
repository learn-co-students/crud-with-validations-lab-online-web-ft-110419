class Song < ApplicationRecord
	include ActiveModel::Validations
	validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year], message: "Cannot have two songs by the same artist released in the same year."}
	validates :release_year, year: true
end
