class ColoradoHikes::CLI

  def call
    ColoradoHikes::Scraper.new.all_hikes #initializes the hikes?
    puts ""
    puts ""
    puts "Welcome to Colorado's best hikes!"
    puts ""
    puts ""
    start
  end

  def start
    puts ""
    puts ""
    puts "Here is a list of the top 20 hikes in the state."
    puts ""
    ColoradoHikes::Scraper.new.first_half #need to break this up so its not so hard to read
    puts ""
    puts ""
    puts "Here are the remaining top hikes in case one of the top 20 did not suit your fancy:"
    ColoradoHikes::Scraper.new.second_half
    puts ""
    puts ""
    puts "Please select the number of the hike you would like more info on:"
    input = gets.strip.to_i
    hike = ColoradoHikes::Hike.find(input)
      print_hike(hike)
    puts ""
    puts "Would you like to see more info on another hike? Enter Y or N"
    input = gets.strip.downcase
      if input == "y"
        start
      elsif
        puts ""
        puts "I don't understand that answer. Please try again."
        start
      else input == "n"
        puts ""
        puts "Thank you! Have a great day and happy hiking!!"
        exit
      end
    end

  def print_hike(hike)
    puts ""
    puts "----------- #{hike.name} -----------"
    puts ""
    #puts "Trailhead:         #{hike.trailhead}"
    #puts "Activities:          #{hike.activities}"
    #puts "Closest City:      #{hike.closest_city}"
    #puts "Distance:            #{hike.distance}"
    #puts "Website:            #{hike.url}"
    #puts ""
    #puts "---------------Description--------------"
    #puts ""
    #puts "#{hike.description}"
    puts ""
  end

end
