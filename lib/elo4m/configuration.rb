module Elo4m
  class Configuration
    attr_accessor :default_k_factor
    attr_accessor :default_rating

    def initialize #:nodoc:
      @default_rating     = 1000
      @default_k_factor   = 15
    end

    # Add a K-factor rule. The first argument is the k-factor value.
    # The block should return a boolean that determines if this K-factor rule applies.
    # The first rule that applies is the one determining the K-factor.
    #
    # The block is instance_eval'ed into the player, so you can access all it's
    # properties directly. The K-factor is recalculated every time a match is played.
    #
    # By default, the FIDE settings are used (see: +use_FIDE_settings+). To implement
    # that yourself, you could write:
    #
    #   Elo.configure do |config|
    #     config.k_factor(10) { pro? or pro_rating? }
    #     config.k_factor(25) { starter? }
    #     config.default_k_factor = 15
    #   end
    #
    def k_factor(factor, &rule)
      k_factors << { :factor => factor, :rule => rule }
    end

    def applied_k_factors #:nodoc:
      apply_fide_k_factors if use_FIDE_settings
      k_factors
    end

    private

    def k_factors
      @k_factors ||= []
    end

    def apply_fide_k_factors
      unless @applied_fide_k_factors
        k_factor(10) { pro? or pro_rating? }
        k_factor(25) { starter? }
        @applied_fide_k_factors = true
      end
    end
  end
end
