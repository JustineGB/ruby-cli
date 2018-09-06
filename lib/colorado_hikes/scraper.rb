class ColoradoHikes::Scraper

  def get_page
    Nokogiri::HTML(open("http://thecohiker.com/colorado-hiking-trails/"))
  end

  def scrape_hikes
    self.get_page.css("div.item-content")
  end

  def create_hikes
    scrape_hikes.each do |h|
      ColoradoHikes::Hike.new_from_page(h)
    end
  end

end
