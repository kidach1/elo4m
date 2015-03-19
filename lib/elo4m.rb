require "elo4m/version"
require "elo4m/configuration"
require "elo4m/game"
require "elo4m/player"
require "elo4m/rating"

module Elo4m
  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield config
  end
end
