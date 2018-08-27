require_relative "./lib/mountains.rb"
require "nokogiri"

class Mountains::CLI 
  
  def cliprogramloop
    list_mountains
    mountain_info 
    goodbye
  end
  
   
  def list_mountains
     puts "Which mountain range would you like to find a hike in? Enter one of the following numbers: (1) Sawatch, (2) Ten Mile, ..."
    #gets
    #case/when 1 return Sawatch mtn names from list (iterate matches from scraped data)
    #url for 14ers page
    #listing out all of the mtns that are within the selected mtn range
  end
  
  def mountain_info 
    puts "Which peak would you like more info on? Select a number from the list above" 
   #gets.to_i or gets.strip.downcase (for no?)
   #find matching peak # in the list and go to that peak's specific webpage to find out more info (like elevation and rank)
   #return peak info 
   #puts "Would you like to learn more about another "mountain? Select another number from the list. If not, please enter no"
    # unil input == "no"
    # input = gets.strip.downcase
    #case input 
    #when "1"
    #  puts "Mount Sherman is X feet high and is ranked as 3rd highest peak"   
    #when "2"
    # puts "Mount Bierstandt..."
     #"no" puts "Thanks and happy hiking!" then program ends. 
  end 
  
  class Mountains
    def scrape
      doc = Nokogiri::HTML(open("https://14ers.com/photos/photos_14ers1.php"))
    end
  end

end