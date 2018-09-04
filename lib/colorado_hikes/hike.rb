class ColoradoHikes::Hike
  attr_accessor :name, :url, :trailhead, :activities, :closest_city, :distance

  @@all = []

  def self.new_from_page(hike) #What is the H argument? Taking in the User input here?!
     self.new(hike.css("div.item-title h3").text)
  end

  def initialize(name=nil) #, url=nil) #instance method. hook. operates on 1 individial instance of the class
    @name = name
  #  @url = url
    @@all << self
  end

  def self.all #class method, class getter (operates on all of the class instances/all of the class objects)
    @@all
  end

  def self.find(id)
     self.all[id-1]
   end

end

#ColoradoHikes::Hike.new_from_index_page(hike)
