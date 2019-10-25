require "tty-prompt"


class Profile

    def initialize 
        @prompt = TTY::Prompt.new
         end


    
    def my_profile_main_menu

        @choice = @prompt.select("What would you like to do?") do |menu|  
          menu.choice 'View My Info', 1
          menu.choice 'Change My Info', 2
          menu.choice 'My Reviews', 3
          menu.choice 'My Taproom', 4
          menu.choice 'Delete Profile', 5
          menu.choice 'Let me see that main menu again', 6
          menu.choice 'Show me to the exit', 7
        end
    
        my_profile_tasks
    end
    
    def my_profile_tasks
      case @choice
          when 1
            # puts "#{$user}"
            profile = $user
            puts "Here is your info"
            puts "-----------------"
            puts profile.first_name
            puts profile.last_name
            puts profile.email
            puts profile.password
            puts profile.about_me
            puts "-----------------"
            puts ""
    
            my_profile_main_menu

          when 2
            user = @prompt.collect do
    
              key(:email).ask('E-mail Address(this will be your username):') 
    
              key(:password).mask('Create a password:')
    
              key(:first_name).ask('First Name')
    
              key(:last_name).ask('Last Name')
    
              key(:about_me).ask('Tell me a little about yourself....')
            end
            
            $user.update(
              first_name: user[:first_name],
              last_name: user[:last_name],
              email: user[:email],
              password: user[:password],
              about_me: user[:about_me]
            )
            my_profile_main_menu
    
          when 3
          if !$user.reviews.empty?
           $user.reviews.each do |r|
             puts "========================="
               puts "Rating: #{r.rating}"
               puts ""
               puts r.description
               puts "========================"
               puts ""
             end
             my_profile_main_menu
           else
             puts "You haven't written any reviews yet."
             my_profile_main_menu
           end

        when 4
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
               end
               my_profile_main_menu
             else
               puts "You haven't added any beer to your Taproom yet! Better get to drinkin'!"
               my_profile_main_menu
             end

            when 5
              binding.pry
                $user.delete
                system 'clear'
                puts "You don't have to go home but you can't stay here..."
          
                # exit

            when 6
                main = Main.new
                main.main_menu

            when 7
                system 'clear'
                # exit
            end
    end


end