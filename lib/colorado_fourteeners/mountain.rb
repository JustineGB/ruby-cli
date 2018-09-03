class ColoradoFourteeners::Mountain
  attr_accessor :name, :standard_route, :elevation_gain, :distance, :klass_difficulty
  @@all = []

  def initialize(name=nil) #instance method. hook. operates on 1 individial instance of the class
    @name = name
  #  @all << self
  end

  def self.all #class method, class getter (operates on all of the class instances/all of the class objects)
    @@all
  end

  def self.new_from_page(m) #constructor. CLASS METHOD. #initialize with name only
#self.new(
#      m.at_css("figcaption h3").text
#    )
  end

  def standard_route #instance method
    #self.get_page.css('br')[0].next.text.strip,
#    @standard_route ==
  end

  def elevation_gain
    #self.get_page.css('br')[1].next.text.strip,
  #  @elevation ||= doc.css("div...").text or value?
  end

  def distance
    #self.get_page.css('br')[2].next.text.strip
    #  @distance ||= doc.css("div...").text or value?
  end

  def klass_difficulty
    #self.get_page.css('br')[3].next.text.strip
  end

end

ColoradoFourteeners::Mountain.new
m = "https://www.outtherecolorado.com/gallery/colorados-14ers-ranked-by-difficulty/"
ColoradoFourteeners::Mountain.new.new_from_index_page(m)
