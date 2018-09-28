class ColoradoHikes::Region
  attr_accessor :name, :url, :hikes
  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @hikes = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def hikes
    @hikes
  end

  def find_hike(id)
    self.hikes[id-1]
  end

end
