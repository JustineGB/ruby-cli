class ColoradoHikes::Scraper

  def self.scrape_main_page #Class method. can be called on all of the objects in that class.
    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
    doc.css("div.categories-container ul li.has-title")
  end

  def self.create_regions
    regions = scrape_main_page.each do |region|
    ColoradoHikes::Region.new_from_page(region)
    regions
    end
  end

end



    #def self.make_hikes(scraped_page)
    #  scraped_page.each do |hike_hash|
    #    Hike.new(hike_hash)
    #  end
#  def self.scrape_hikes #takes in the argu of the selected region and its hikes
    #hike = {}
#    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
#    doc.css("div.categories-container ul li.has-title").each do |r|
    #  ColoradoHikes::Hike.new
#    binding.pry
#        list = r.css("a").attribute("href").text
#        hike[list.to_sym] = {
#          :name => hike.css("a").attribute("href").value,
#          :url => hike.css("h3").text
#      }
    #hike.url = name.css("a").attribute("href").value
    #hike.name = name.css("h3").text
#end
#end
