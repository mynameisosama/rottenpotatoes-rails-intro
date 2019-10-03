class Movie < ActiveRecord::Base
    def self.get_all_ratings
        Movie.uniq.pluck(:rating)
    end
    def self.get_sorted(sort_key)
        Movie.order(sort_key)
    end
    def self.with_ratings(ratings)
        Movie.where(rating: ratings)
    end
end
