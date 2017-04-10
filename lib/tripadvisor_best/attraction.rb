class TripAdvisorBest::Attraction
  attr_accessor :name, :location, :ranking, :url
  @@all = []

  def initialize(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(attractions_array)
    attractions_array.each{|attraction| self.new(attraction)}
  end

  def add_attraction_attributes(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
  end
end
