class ColoradoFourteeners::Scraper

  def get_page
    @doc = Nokogiri::HTML(open("https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/"))
  end

  def mountain_list
    self.get_page.xpath('//figcaption/h3').collect { |h3| h3.content}
  end

  def ordered_list
    ordered_list = mountain_list.reverse
    ordered_list.each {|e| e.inspect}
    puts ordered_list
  end

  def full_details(url)
    self.get_page
    mountain = {}
    mountain[:name] = @doc.at_css('figcaption h3').text #need to remove the numbers in front? and turn this into the key. not a key and value.
    mountain[:standard_route] = @doc.css('br')[0].next.text.strip
    mountain[:elevation_gain] = @doc.css('br')[1].next.text.strip
    mountain[:distance] = @doc.css('br')[2].next.text.strip
    mountain[:klass_difficulty] = @doc.css('br')[3].next.text.strip
    mountain
    end
  end

 end

#url = "https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/"
ColoradoFourteeners::Scraper.new.full_details("https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/")
