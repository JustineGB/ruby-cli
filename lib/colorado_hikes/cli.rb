class ColoradoHikes::CLI

  def call
    ColoradoHikes::Scraper.new.create_hikes #initializes the hikes?
    puts " ______________________________________________"
    puts " ______________________________________________"
    puts "Welcome to Colorado's best hikes!"
    start
  end

  def start
    puts " ______________________________________________"
    puts "The top 76 hikes in Colorado are categorized alphabetically by the hike's name."
    puts "Please select the section that you would like to start with:"
  #  puts " ______________________________________________"
  #  puts "Enter 1-13 to see A through M"
  #  puts "Enter 1"
  #  ColoradoHikes::Scraper.list_all
  #  puts " ______________________________________________"
  #  input = gets.strip.to_i
  #    if input.between?(1,2) == true
       print_hikes #(input)
  #    else
  #     puts "I don't understand that answer. Please enter 1 or 2."
  #     start
  #   end

    puts " ______________________________________________"
    puts " ______________________________________________"
    puts "Please select a hike that you would like more info on:"
    input = gets.strip.to_i
     if input.between?(1,76) == true
        user_selection = input # 1
        hike = ColoradoHikes::Hike.find(user_selection)
        print_hike(hike)
      else
       puts "I don't understand that answer."
       puts "Please enter a number between 1 and 76 for the corresponding hike."
     end

    puts "Would you like to see more info on another hike? Enter Y or N"
    input = gets.strip.downcase
      if input == "y"
        start
      elsif input == "n"
        puts "Thank you! Have a great day and happy hiking!!"
        exit
      else
        puts "I don't understand that answer. Please try again."
        start
      end
    end

  def print_hike(hike)
    puts " ______________________________________________"
    puts " ______________________________________________"
    puts "Great Selection! #{hike.name} is an awesome hike! Here is the info:"
    puts "#{hike.trailhead}"
    puts "#{hike.distance}"
    puts "#{hike.activities}"
    puts "#{hike.closest_city}"
  end


    def print_hikes #(from_number)
      puts ""
      puts "Hike"  #{from_number}"
      puts ""
      ColoradoHikes::Hike.all.each.with_index do |h, i|
        indexplusone = i + 1
        puts "#{indexplusone}: #{h.name}"

      end
    end

end
