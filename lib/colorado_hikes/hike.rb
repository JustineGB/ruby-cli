class ColoradoHikes::Hike
  attr_accessor :name, :url
  @@all = []

  def initialize(name=nil, url=nil) #add in region here? to org into regional catergoies?? #instance method. hook. operates on 1 individial instance of the class
    @name = name
    @url = url
    @@all << self
  end

  def self.all #Class Method, Class getter (operates on all of the class instances/all of the class objects). Allows you to 'get' all of the objects stored in @@all
    @@all #Class variable (scope is both class & instances).
  end

 def save
    @@all << self
  end

  def self.find(id) #when called from the CLI this method will return the hike name that correspondes to the user input (minus 1 to match the index)
    self.all[id-1]
   end

  def doc #create this method so that you don't have to def local doc varaibale in each of the following methods #scraping methods that make sense to have in the Hike Class bc they are creating individual hike attirbutes
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def hike_info1
    @hike_info1 ||= doc.css("div.entry-content p").first.text
  end

  def hike_info2
    @hike_info2 ||= doc.css("div.entry-content p[2]").text
  end

  def hike_info3
    @hike_info3 ||= doc.css("div.entry-content p[3]").text
  end

  def hike_info4
    @hike_info4 ||= doc.css("div.entry-content p[6]").text
  end

end
