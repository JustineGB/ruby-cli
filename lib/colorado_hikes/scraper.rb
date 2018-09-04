class ColoradoHikes::Scraper

  def get_page
    Nokogiri::HTML(open("http://thecohiker.com/colorado-hiking-trails/"))
  end

  def scrape_hikes
    self.get_page.css("div.item-content")
  end

  #def list_all
  #  @hikes = self.get_page.css("div.item-title h3").collect {|h| h.text }
  #  @hikes.each_with_index do |object, index|
  #    indexplusone = index + 1
  #      puts "#{indexplusone}: #{object}"
#    end
#  end

  #def split_list
    #hikes = self.get_page.css("div.item-title h3").collect {|h| h.text }
    #  @first_half_hikes = hikes[0, 19]
    #  @second_half_hikes = hikes[20, 75]
#  end

  def first_half
    hikes = self.get_page.css("div.item-title h3").collect {|h| h.text }
      @first_half_hikes = hikes[0, 19]
    @first_half_hikes.each_with_index do |object, index|
      indexplusone = index + 1
      puts "#{indexplusone}: #{object}"
    end
  end

  def second_half
    hikes = self.get_page.css("div.item-title h3").collect {|h| h.text }
      @second_half_hikes = hikes[20, 75]
    @second_half_hikes.each_with_index do |object, index|
      indexplusone = index + 19
      puts "#{indexplusone}: #{object}"
    end
  end

  def all_hikes
    scrape_hikes.each do |hike|
      ColoradoHikes::Hike.new_from_page(hike)
    end
  end

end
