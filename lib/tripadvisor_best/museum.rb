require_relative 'place'

class TripAdvisorBest::Museum < TripAdvisorBest::Place
  attr_accessor :name, :location, :ranking, :url, :description
  @@all = []

  def initialize(attributes)
    super
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find(i)
    self.all[i]
  end
end
