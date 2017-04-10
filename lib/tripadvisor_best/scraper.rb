class TripAdvisorBest::Scraper

  def get_page(url)
    Nokogiri::HTML(open(url))
  end

  def scrape_listings_page(url)
    page = self.get_page(url)
    highlights_array = []
    page.css("#WINNERVIEWER div.posRel.tcInner").each do |e|
      highlight = {
        :name => e.css(".mainName a").text,
        :location => e.css(".winnerName .smaller a").text,
        :ranking => e.css("div.posn span").text,
        :url => "https://www.tripadvisor.com/#{e.css(".mainName a").attribute("href").value}"
      }

      highlights_array << highlight
    end
    highlights_array
  end

  def scrap_details_page(url)
    page = self.get_page(url)
    highlight_details = {}
    binding.pry
    page.css("div.main_section.listingbar").each do |e|
      highlight_details[:address] = e.css(".format_address span").text
      highlight_details[:hours] = e.css(".hours_wrapper div.time").text
      highlight_details[:visit_length] = e.css(".details_wrapper div.detail").first.text
      highlight_details[:description] = e.css(".details_wrapper div.listing_details p").text
    end
    highlight_details
  end
end
