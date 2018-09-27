class ColoradoHikes::Hike
  attr_accessor :name, :url, :info1, :info2, :info3, :info4, :info5
  @@all = []

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find(id)
    self.all[id-1]
  end

end
