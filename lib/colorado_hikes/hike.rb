class ColoradoHikes::Hike

  attr_accessor :name, :url, :trailhead, :activities, :closest_city, :distance

  @@all = []

  #  def create_hikes
  #    scrape_hikes.each do |h|
  #      ColoradoHikes::Hike.new_from_page(h)
  #    end

  #def self.new_from_selection(h) #new from the region that is selected.
  #  self.new(
        #"http://thecohiker.com/loc#{}"
        #h.css("div.item-title h3").text,
        #h.css("div.item-title a").attribute("href").text
  #     )
  #end


  def initialize(name=nil, url=nil)  #instance method. hook. operates on 1 individial instance of the class
    @name = name
    @url = url
    @@all << self
  end

  def self.all #class method, class getter (operates on all of the class instances/all of the class objects)
    @@all #class var. scope class and instances.
  end

  def self.find(id) #when called from the CLI this method will return the hike name that correspondes to the user input (minus 1 to match the index)
    self.all[id-1]
   end

  def doc #create this method so that you don't have to def local doc varaibale in each of the following methods #scraping methods that make sense to have in the Hike Class bc they are creating individual hike attirbutes
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def trailhead
    @trailhead ||=  doc.css("div.full-description").text
  end

  def activities
    @activities ||= doc.css("div.entry-content p[2]").text
  end

  def closest_city
    @closest_city ||= doc.css("div.entry-content p[3]").text
  end

  def distance
    @distance ||= doc.css("div.entry-content p[6]").text
  end

end
