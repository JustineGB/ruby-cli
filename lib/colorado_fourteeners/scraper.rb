class ColoradoFourteeners::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/"))
    #page = "https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/"
    #content = open(page).read
    #doc = Nokogiri::HTML(content)
  end
#
  def scrape_list
    list = self.get_page.xpath('//figcaption/h3').collect { |h3| h3.content} #replace(" ") }
    ordered_list = list.reverse
    ordered_list.each {|e| e.inspect }
    puts ordered_list
  end
end
s = ColoradoFourteeners::Scraper.new
s.scrape_list
