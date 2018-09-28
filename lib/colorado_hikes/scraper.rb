class ColoradoHikes::Scraper

  def self.scrape_regions
    doc = Nokogiri::HTML(open("http://thecohiker.com/loc/colorado-hiking-trails/"))
    page = doc.css("div.categories-container ul li.has-title")
    page.each do |r|
      region = ColoradoHikes::Region.new
      region.name = r.css("span.cat-ttl").children.text
      region.url = r.css("a").attribute("href").text
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
