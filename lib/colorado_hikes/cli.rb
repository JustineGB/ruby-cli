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
    selected_region = ColoradoHikes::Region.find(input)
    if input.between?(1, ColoradoHikes::Region.all.size) == true
      ColoradoHikes::Scraper.scrape_hikes(selected_region) if selected_region.hikes == []
      print_region(selected_region)
      select_hike(selected_region)
    else
      puts "I don't understand that answer. Please enter a number between 1 and 6 for the corresponding region.".blue
      select_region
    end
  end

  def select_hike(selected_region)
    puts ""
    puts "Please select the hike you would like information on:".blue
    input = gets.strip.to_i
    if input.between?(1,selected_region.hikes.size) == true
    selected_hike = selected_region.find_hike(input)
      ColoradoHikes::Scraper.scrape_hike_info(selected_hike) if selected_hike.info1 == nil
      print_hike_info(selected_hike)
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
    puts "#{hike.info1}".yellow
    puts "#{hike.info2}".yellow
    puts "#{hike.info3}".yellow
    puts "#{hike.info4}".yellow
    puts "#{hike.info5}".yellow
end

end
