class ColoradoHikes::Scraper

  def self.scrape_main_page #Class method. can be called on all of the objects in that class.
    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
    doc.css("div.categories-container ul li.has-title")
  end

  def self.create_regions
    scrape_main_page.each do |region|
    ColoradoHikes::Region.new_from_page(region)
    end
  end

end
