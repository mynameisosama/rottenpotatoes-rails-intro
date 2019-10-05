class Movie < ActiveRecord::Base
    # Get all possible ratings from database
    # This is more consistant and accurate than enumeration
    def self.get_all_ratings
        Movie.uniq.pluck(:rating)
    end
    # Use SQL ORDER BY for sorting
    def self.get_sorted(sort_key)
        Movie.order(sort_key)
    end
    # Use SQL WHERE for filtering
    def self.with_ratings(ratings)
        Movie.where(rating: ratings)
    end
end
