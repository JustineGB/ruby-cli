class ColoradoHikes::Scraper

  def get_page
    Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
    #Nokogiri::HTML(open("http://thecohiker.com/colorado-hiking-trails/"))
  end

  def scrape_regions
    self.get_page.css("span.cat-ttl").children
  end


   def create_regions
      scrape_regions.each do |h|
        ColoradoHikes::Regions.new_from_page(h)
      end
    end

  end




#doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
#doc.css("div.content span").text

#  def scrape_hikes
#    self.get_page.css("div.item-content")
#  end

#  def create_hikes
#    scrape_hikes.each do |h|
#      ColoradoHikes::Hike.new_from_page(h)
#    end
#  end

#end
