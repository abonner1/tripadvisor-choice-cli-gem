class TripAdvisorBest::Place

  def initialize(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
  end

  def self.create_from_collection(museums_array)
    museums_array.each{|museum| self.new(museum)}
  end

  def add_museum_attributes(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
  end

end
