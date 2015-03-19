module Elo4m
  class Player
    attr_accessor :rating
    attr_accessor :ranking

    def initialize(rating, ranking)
      self.rating = rating
      self.ranking = ranking
    end
  end
end
