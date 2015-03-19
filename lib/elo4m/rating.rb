module Elo4m
  class Rating
    attr_reader :other_rating
    attr_reader :old_rating
    attr_reader :expected

    def initialize(args = {})
      args.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def new_rating
      (old_rating.to_f + change).to_i
    end

    # The expected score is the probably outcome of the match, depending
    # on the difference in rating between the two players.
    def expected_al
      1.0 / ( 1.0 + ( 10.0 ** ((other_rating.to_f - old_rating.to_f) / 400.0) ) )
    end

    private

    def result
      @result.to_f
    end

    def valid_result?
      (0..1).include? @result
    end

    def change
      expected = self.expected.nil? ? expected_al : self.expected
      Elo4m.config.k_factor.to_f * ( result.to_f - expected )
    end
  end
end
