class ColoradoHikes::Regions

  attr_accessor :name, :url, :hikes

  @@all = []

  def self.new_from_page(region)
    self.new(
      region.css("span.cat-ttl").children.text,
      region.css("a").attribute("href").text
    )
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

   def doc #create this method so that you don't have to def local doc varaibale in each of the following methods #scraping methods that make sense to have in the Hike Class bc they are creating individual hike attirbutes
     @doc ||= Nokogiri::HTML(open(self.url))
   end

   def hikes  #need to be able to list out just the title of each hike within that region (should be done in the CLI class)...
     @hikes ||= doc.css("div.grid-main h3").text
   end

end
