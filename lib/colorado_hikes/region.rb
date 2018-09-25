class ColoradoHikes::Region
  attr_accessor :name, :url
  @@all = []

  def self.new_from_page(region)
    self.new(
      region.css("span.cat-ttl").children.text,
      region.css("a").attribute("href").text)
  end

  def initialize(name=nil, url=nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def hikes
    doc ||= Nokogiri::HTML(open(self.url))
    @hikes = []
    doc.css("div.item-title").each do |h|
      hike = ColoradoHikes::Hike.new
      hike.url = h.css("a").attribute("href").value
      hike.name = h.css("h3").text
      @hikes << hike
    end
      @hikes
   end

end
