#require_relative './lib/colorado-fourteeners'

class ColoradoFourteeners::Mountain
  attr_accessor :name, :elevation, :range 
  
  @@all = []
  
 def initialize(name) #nil, number=nil) #number of mtn in the list
    @name = name
  #  @number = number
  #  @all << self 
  end
  
  def self.all #show list of self (mtn objects)
   @@all
  end
    
  def self.new_from_list(input) #argument of either the mtn name or the mtn number on the list 
    self.new #(scrape the mtn from the given argument)
  end
  
  def name
    #find mtn name 
  end
  
  def elevation
  end

  def range
  end

end




