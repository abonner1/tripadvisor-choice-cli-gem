class TripAdvisorBest::CLI
  attr_reader :sites

  def initialize
    @sites = [
      {class_name: TripAdvisorBest::Museum, url: "https://www.tripadvisor.com/TravelersChoice-Museums#1"},
      {class_name: TripAdvisorBest::Attraction, url: "https://www.tripadvisor.com/TravelersChoice-Attractions"},
      {class_name: TripAdvisorBest::Landmark, url: "https://www.tripadvisor.com/TravelersChoice-Landmarks"}
    ]
  end

  def call
    welcome
    menu
  end

  def welcome
    puts "The TripAdvisor Traveler's Choice Awards are out."
    puts "Are you ready to plan your next trip?"
    puts "  (Type 'exit' to leave program.)"
  end

  def menu
    input = nil
    while input != "exit"
      list_options
      input = gets.strip.downcase
      case input
      when "1"
        puts "Here are the top 25 Museums in the world..."
        make_objects(sites[0][:class_name], sites[0][:url])
        see_more_details
      when "2"
        puts "Here are the top 25 Attractions in the world..."
        make_objects(TripAdvisorBest::Attraction, 1)
      when "3"
        puts "Here are the top 25 Landmarks in the world..."
        make_objects(TripAdvisorBest::Landmark, 2 )
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

  def make_objects(class_name, url)
    objects_array = []
    objects_array = TripAdvisorBest::Scraper.new.scrape_listings_page(url)
    class_name.create_from_collection(objects_array)
    list_top_level(class_name)
  end

  def list_top_level(class_name)
    class_name.all.each do |place|
      puts "#{place.ranking}. - #{place.name} - #{place.location}"
    end
  end

  def see_more_details
    puts "Which one would you like to see more details?"
  end

end
