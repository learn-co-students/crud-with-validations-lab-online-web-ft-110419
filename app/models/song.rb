class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
  validates :release_year, year:true

end
