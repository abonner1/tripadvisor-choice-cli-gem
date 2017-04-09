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
      when "1"
        puts "Here are the top 25 Museums in the world..."
        # Add more info option for Museums
        # This won't work for Landmarks but maybe for Attractions too
      when "2"
        puts "Here are the top 25 Attractions in the world..."
      when "3"
        puts "Here are the top 25 Landmarks in the world..."
      when "list"
        list_options
      when "exit"
        goodbye
      else
        puts "I'm not sure what you want. Either type 'list' or 'exit'."
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
    puts "Which would you like to see?"
  end

  def goodbye
    puts "Bon voyage!"
  end

end
