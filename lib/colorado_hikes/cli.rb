class ColoradoHikes::CLI

  def call
    ColoradoHikes::Scraper.create_regions
    puts ""
    puts "WELCOME TO THE BEST HIKES IN COLORADO!".blue
    puts "The hikes are organized into the following 6 regions.".blue
   select_region
  end

  def select_region
    print_regions
    puts ""
    puts "Please select a region. Enter 1-6:".blue

    input = gets.strip.to_i

    if input.between?(1,6) == true
      selected_region = ColoradoHikes::Region.find(input)
      print_region(selected_region)
      select_hike
    else
      puts "I don't understand that answer. Please enter a number between 1 and 6 for the corresponding region.".blue
      select_region
    end
  end

  def select_hike
    puts ""
    puts "Please select the hike you would like information on:".blue

    input = gets.strip.to_i

    if input.between?(1,12) == true
      hike = ColoradoHikes::Hike.find(input)
      print_hike_info(hike)
      another_hike?
    else
      puts "I don't understand that answer. Please enter a hike number:".blue
      select_hike
    end
  end

  def another_hike?
    puts ""
    puts "Would you like to see information on another hike? Please enter Y or N.".blue

    input = gets.strip.downcase

    if input == "y"
    ColoradoHikes::Hike.all.clear #clears the other hikes that are listed from other regions (only list the selected regions' hikes)
      select_region
    else input == "n"
      puts "Thank you! Have a great day and happy hiking!!".blue
      exit
    end
  end

  def print_regions
    ColoradoHikes::Region.all.each.with_index(1) do |region, index|
      puts "#{index}: #{region.name}".red
    end
  end

  def print_region(selected_region)
    puts ""
    puts "#{selected_region.name}".red
    print_hikes(selected_region) #pass in the selected region
  end

  def print_hikes(selected_region)
    selected_region.hikes.each.with_index(1) do |h, i|
      puts "#{i}: #{h.name}".yellow
    end
  end

  def print_hike_info(hike)
    puts ""
    puts "Great Selection! ".blue + "#{hike.name}".yellow + " is an awesome hike! Here is the info:".blue
    puts "#{hike.hike_info1}".yellow
    puts "#{hike.hike_info2}".yellow
    puts "#{hike.hike_info3}".yellow
    puts "#{hike.hike_info4}".yellow
  end

end
