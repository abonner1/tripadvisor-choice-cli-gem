class TripAdvisorBest::Museum
  attr_accessor :name, :location, :ranking, :url, :hours, :visit_length, :fee, :description, :website
  @@all = []

  def initialize(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def add_attributes(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
  end
end
