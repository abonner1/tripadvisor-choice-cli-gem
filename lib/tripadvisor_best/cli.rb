class TripAdvisorBest::CLI

  def call
    welcome
    menu
  end

  def welcome
    puts "The TripAdvisor Traveler's Choice Awards are out."
    puts "Are you ready to plan your next trip?"
  end

  def menu
    input = nil
    while input != "exit"
      list_options
      input = gets.strip.downcase
      case input
      when
      end
    end
  end

  def list_options
    puts "Currently you can see..."
    puts <<-DOC
      1. Top 25 Museums
      2. Top 25 Attractions
      3. Top 25 Landmarks
    DOC
  end

end
