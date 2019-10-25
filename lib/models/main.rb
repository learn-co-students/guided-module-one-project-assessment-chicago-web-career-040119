
require "tty-prompt"

class Main

    def initialize 
        @prompt = TTY::Prompt.new
         end

def menu_choice
   choice = @prompt.select("What can I getcha?") do |menu|
      menu.default 1

      menu.choice 'Try something new', 1
      menu.choice 'Check out my taproom', 2
      menu.choice 'My Profile', 3
      menu.choice 'Leave the Bar', 4
    end
    
end

def main_menu
    case menu_choice
    when 1
        newb = NewBeer.new
        newb.try_this
        main_menu
    when 2
        if !$user.beers.empty?
            $user.beers.each do |b|
              puts "========================="
                puts "Name: #{b.name}"
                puts ""
                puts "ABV: #{b.abv}"
                puts ""
                puts "Style: #{b.style}"
                puts ""
                puts "Brewery: #{b.brewery}"
                puts ""
                puts "Location: #{b.location}"
                puts ""
                puts "Description: #{b.description}"
                puts ""
                puts "========================"
                puts ""
            main_menu
              end
            else
              puts "You haven't added any beer to your Taproom yet! Better get to drinkin'!"
             main_menu
            end
    when 3
        profile = Profile.new
        profile.my_profile_main_menu
    when 4
        system 'clear'
                puts "You don't have to go home but you can't stay here..."
                exit
    end


end


end