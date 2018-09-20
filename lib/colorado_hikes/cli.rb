class ColoradoHikes::CLI

  def call
    puts ""
    puts "Select your region"
    #input = gets.strip.to_i
    #if input == call that regions specific scraper method!
    #  will need to set up a scraper method and a hike class for each region?
    #  no just for the scraper bc the hike will be the same based onb the scrape info
   #ColoradoHikes::Scraper.new.create_hikes #initialize
   ColoradoHikes::Scraper.new.create_regions
    puts "Welcome to Colorado's best hikes!"
    print_regions
  #  list_regions
  #  start
    #another_hike?
  end

  #def start
  #  puts ""
  #  puts "Please select a region"

  #  input = gets.strip.to_i

  #  if input.between?(1,76) == true
  #    user_selection = input
  #    selected_hike = ColoradoHikes::Hike.find(user_selection)
      #print_hike(selected_hike)
  #  else
  #    puts "I don't understand that answer. Please enter a number between 1 and 76 for the corresponding hike."
  #    start
  #  end
#  end

  #def another_hike?
  #  puts "Would you like to see information on another hike? Please enter Y or N."
#
  #  input = gets.strip.downcase

  #  if input == "y"
  #    start
#    elsif input == "n"
#      puts "Thank you! Have a great day and happy hiking!!"
  #    exit
#    else
  #    puts "I don't understand. Please enter Y or N."
  #    another_hike?
  #  end
#  end

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


  def print_regions
    ColoradoHikes::Regions.all.each.with_index do |h, i|
        indexplusone = i + 1
      puts "#{indexplusone}: #{h.name}"
    end
  end

    #def print_hikes #(from_number)
  #    puts "Hike"  #{from_number}"
    #  ColoradoHikes::Hike.all.each.with_index do |h, i|
    #    indexplusone = i + 1
    #    puts "#{indexplusone}: #{h.name}"
    #  end
    #end

end
