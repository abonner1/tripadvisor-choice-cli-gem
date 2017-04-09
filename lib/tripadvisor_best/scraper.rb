class TripAdvisorBest::Scraper

  def get_page(site)
    Nokogiri::HTML(open(site))
  end

  def scrape_page(site)
    page = self.get_page(site)
    place_array = []
    page.css("#WINNERVIEWER div.posRel.tcInner").each do |e|
      place = {
        :name => e.css(".mainName a").text,
        :location => e.css(".winnerName .smaller a").text,
        :ranking => e.css("div.posn span").text,
        :url => e.css(".mainName a").attribute("href").value
      }

      place_array << place
    end
    place_array
  end
end
