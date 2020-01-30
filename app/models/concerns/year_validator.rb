class YearValidator < ActiveModel::EachValidator
  def validate_each(record, attr, value)
    if record.released && value.blank?
      record.errors.add(attr, "If the album was released, you must provide the release year.")
    end

    if value && value.class == Integer
      if value > Time.now.year
        record.errors.add(attr, "Release year must be an integer.")
      end
    elsif value && value.class != Integer
      record.errors.add(attr, "Release year must be an integer.")
    end
  end
end
