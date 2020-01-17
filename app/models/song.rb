class Song < ApplicationRecord
    validates :title, presence: true


    # is invalid without release year when released is true (FAILED - 7)
    # is valid without release year when released is false
    # is invalid when the release year is in the future (FAILED - 8)
    # is invalid if an artist tries to release the same song twice in a year (FAILED - 9)

end
