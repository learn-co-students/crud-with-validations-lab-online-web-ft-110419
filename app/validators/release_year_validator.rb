class ReleaseYearValidator < ActiveModel::Validator
  def release_year_cannot_be_in_the_past
    if release_year > Date.current.year
      errors.add(:release_year, "can't be in the past")
    end
  end
end
