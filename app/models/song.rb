class Song < ActiveRecord::Base
    validates :title, uniqueness: true, presence: true
    validates :release_year, presence: true, if: :released?, numericality: {only_integer: true, less_than_or_equal_to: 2020}

    def released?
        self.released == true
    end

end