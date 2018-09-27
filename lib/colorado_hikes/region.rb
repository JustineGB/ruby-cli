class ColoradoHikes::Region
  attr_accessor :name, :url, :hikes
  @@all = []

  def self.new_from_page(region)
    self.new(
      region.css("span.cat-ttl").children.text,
      region.css("a").attribute("href").text)
  end

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

end
