class ColoradoHikes::CLI

attr_accessor :regions

  def call
    puts "Welcome to the best hikes in Colorado!"
    puts "The hikes are organized into the following 6 regions:"
    ColoradoHikes::Scraper.new.create_regions
    print_regions
    start
  end

  def print_regions
    ColoradoHikes::Regions.all.each.with_index(1) do |r, i|
      puts "#{i}: #{r.name}"
    end
  end

  def start
    puts "Please select a region. Enter 1-6:"
    input = gets.strip.to_i
    if input.between?(1,6) == true
      selected_region = ColoradoHikes::Regions.find(input)
      print_region_and_hikes(selected_region)
      #print_regions_hikes(selected_region)
      #this needs to print the name of the region and then call on the HIKE instances to list out each hike within that region?
    else
      puts "I don't understand that answer. Please enter a number between 1 and 6 for the corresponding region."
      exit
    end
  end

  def print_region_and_hikes(region)
    puts "#{region.name}"
    puts "#{region.url}"
    puts "#{region.hikes}"
  end

  #def print_regions_hikes(region)
  #  ColoradoHikes::Regions.each.with_index(1) do |r, i|
  #  puts "#{i}: #{region.hikes}"
  #end
#end

end





























  #def another_hike?
    #puts "Would you like to see information on another hike? Please enter Y or N."
    #input = gets.strip.downcase
    #if input == "y"
      #start
    #elsif input == "n"
      #puts "Thank you! Have a great day and happy hiking!!"
      #exit
    #else
      #puts "I don't understand. Please enter Y or N."
      #another_hike?
    #end
  #end

  #def print_hike(hike)
  #  puts ""
  #  puts "Great Selection! #{hike.name} is an awesome hike! Here is the info:"
  #  puts ""
  #  puts "#{hike.trailhead}"
  #  puts "#{hike.activities}"
  #  puts "#{hike.closest_city}"
  #  puts "#{hike.distance}"
  #  puts ""
  #end

  #def print_hikes #(from_number)
    #puts "Hike"  #{from_number}"
    #ColoradoHikes::Hike.all.each.with_index do |h, i|
      #indexplusone = i + 1
      #puts "#{indexplusone}: #{h.name}"
    #end
  #end
