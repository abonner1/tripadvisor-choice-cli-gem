class TripAdvisorBest::Landmark
  attr_accessor :name, :location, :ranking, :url
  @@all = []

  def initialize(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create_from_collection(landmarks_array)
    landmarks_array.each{|landmark| self.new(landmark)}
  end

  def add_landmark_attributes(attributes)
    attributes.each{|k, v| self.send(("#{k}="), v)}
  end
end
