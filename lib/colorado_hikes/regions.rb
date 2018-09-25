class ColoradoHikes::Regions
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

#  def hikes  #Move this method to the hike class?
#     doc ||= Nokogiri::HTML(open(self.url))
#     @hikes = []
#     doc.css("div.item-title").collect do |name|
#       hike = ColoradoHikes::Hike.new
#       hike.url = name.css("a").attribute("href").value
#       hike.name = name.css("h3").text
#      @hikes << hike
#     end
#    @hikes
#   end

end
