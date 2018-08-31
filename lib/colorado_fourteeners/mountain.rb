class ColoradoFourteeners::Mountain
  attr_accessor :name, :standard_route, :elevation_gain, :distance

  @@all = []

 def initialize
    @name = name
    @standard_route = standard_route
    @elevation_gain = elevation_gain
    @distance = distance
  #  @all << self
  end

  def self.all #show list of self (mtn objects)
   @@all
  end

  def self.new_from_list_page(m)
    #self.new #(scrape the mtn from the given argument)
    #just return the name and the number 
  end

  def elevation
  #  @elevation ||= doc.css("div...").text or value?
  end

  def range
    #  @range ||= doc.css("div...").text or value?
  end

end


m = ColoradoFourteeners::Mountain.new
