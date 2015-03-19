module Elo4m
  class Configuration
    attr_accessor :k_factor

    def initialize
      @k_factor = 32
    end
  end
end
