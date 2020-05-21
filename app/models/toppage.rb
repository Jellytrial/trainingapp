class Toppage < ApplicationRecord

# define search method
def self.search(search)
    if search.blank?  # blank? covers both nil and empty string
        all
    else
        Course.all
    end

end