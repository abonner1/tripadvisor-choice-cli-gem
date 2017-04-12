class TripAdvisorBest::Scraper

  def get_page(url)
    Nokogiri::HTML(open(url))
  end

  def scrape_listings_page(url)
    page = self.get_page(url)
    highlights_array = page.css("#WINNERVIEWER div.posRel.tcInner").collect do |e|
      highlight = {
        :name => e.css(".mainName a").text,
        :location => e.css(".winnerName .smaller a").text,
        :ranking => e.css("div.posn span").text,
        :url => "https://www.tripadvisor.com/#{e.css(".mainName a").attribute("href").value}"
      }
    end
    highlights_array
  end

  def scrap_details_page(url)
    page = self.get_page(url)
    highlight_details = {}
    page.css("div.main_section.listingbar").each do |e|
      if e.css(".details_wrapper div.listing_details p") != nil
        highlight_details[:description] = e.css(".details_wrapper div.listing_details p").text
      end
    end
    highlight_details
  end
end
