class ColoradoHikes::Scraper

  def get_page
    Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
  end

  def scrape_regions
    self.get_page.css("div.categories-container ul li.has-title")
  end

  def create_regions
    scrape_regions.each do |r|
      ColoradoHikes::Regions.new_from_page(r)
    end
  end

end



#doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
#scrape = doc.css("div.categories-container ul li.has-title")
#hikes = scrape.css("a").text


















  #def self.scrape_regions
#    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
#    regions = doc.css("div.categories-container ul li.has-title")
#    create_regions(regions)
#    regions
#  end

#  def self.create_regions(regions)
#    regions.each do |region|
#      ColoradoHikes::Regions.new({
#        name: region.css("span.cat-ttl").children.text,
#        url: region.xpath('//div/a/@href').text
#      })
#    end
#  end
#end

#    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-canyons-plateaus/"))
#ColoradoHikes::Scraper.scrape_region

#  def create_regions
#    scrape_regions.each do |r|
#      ColoradoHikes::Regions.new_from_page(r)
#    end
#  end

#  def scrape_hikes(r) #pass in argument of the selected region

  #def scrape_hikes
  #  self.get_page.css("div.item-content")
  #end

  #def create_hikes
  #  scrape_hikes.each do |h|
  #   ColoradoHikes::Hike.new_from_page(h)
  #  end
  #end
