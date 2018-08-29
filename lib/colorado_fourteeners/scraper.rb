class ColoradoFourteeners::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.14ers.com/photos/photos_14ers1.php"))
  end

  def scrape_mountain_list
  # self.get_page.css("td a").text
  end

  def make_mountains
  end

end
#s = Scraper.new
#s.scrape_mountain_list
