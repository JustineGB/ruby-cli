require 'open-uri'
require 'nokogiri'

 class Scraper
   def get_page
    Nokogiri::HTML(open("https://www.14ers.com/photos/photos_14ers1.php"))
    end
    
  def scrape_mountain_list 
     self.get_page.css("td a href img a") #.attr("a")
     #("td a").attr("href").value
  end

end

s = Scraper.new
s.scrape_mountain_list

