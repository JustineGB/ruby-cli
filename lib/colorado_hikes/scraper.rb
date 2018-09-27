class ColoradoHikes::Scraper

  def self.scrape_main_page #Class method. can be called on all of the objects in that class.
    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
    doc.css("div.categories-container ul li.has-title")
  end

  def self.create_regions
    page = scrape_main_page
    page.each do |region|
      ColoradoHikes::Region.new_from_page(region)
    end
  end

  def self.scrape_hikes(selected_region)
    doc ||= Nokogiri::HTML(open(selected_region.url))
    doc.css("div.item-title").each do |h|
      hike = ColoradoHikes::Hike.new
        hike.url = h.css("a").attribute("href").value
        hike.name = h.css("h3").text
      selected_region.hikes << hike
    end
   end

   def self.scrape_hike_info(selected_hike)
     doc = Nokogiri::HTML(open(selected_hike.url))
     selected_hike.info1 = doc.css("div.entry-content p[1]").text
     selected_hike.info2 = doc.css("div.entry-content p[2]").text
     selected_hike.info3 = doc.css("div.entry-content p[3]").text
     selected_hike.info4 = doc.css("div.entry-content p[6]").text
     selected_hike.info5 = doc.css("div.entry-content p[7]").text
   end

 end
