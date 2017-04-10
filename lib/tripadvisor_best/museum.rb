require_relative 'place'
class TripAdvisorBest::Museum < TripAdvisorBest::Place
  attr_accessor :name, :location, :ranking, :url
  @@all = []

  def initialize(attributes)
    super
    self.class.all << self
  end

  def self.all
    @@all
  end
end
