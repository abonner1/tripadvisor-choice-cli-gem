class TripAdvisorBest::Museum
  attr_accessor :name, :location, :ranking
  @@all = []

  def initialize(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_attributes()

  end
end
