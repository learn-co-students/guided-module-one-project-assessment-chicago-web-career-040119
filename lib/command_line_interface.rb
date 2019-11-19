
require "colorize"

  def show_actor_list
    Actor.all.map do |actor_instance|
      actor_instance.list_name
    end.each_with_index do |actor, index|
      puts "#{index +1}. #{actor}"
    end
  end

  def show_movie_list
    Movie.all.map do |movie_instance|
      movie_instance.list_movie_title
    end.each do |title|
      puts title
     end
  end



  def welcome
      puts "      ***      WELCOME TO DomdB     ***   ".blue.bold
      puts "  THE COOLEST ACTOR INFO APP OUT THERE! ***".blue
      puts
      puts "Have you recently saw a good movie, and you're trying to get more cool info on the actors? or maybe you would like to share some new actors, from the movie, which we missed, with the rest of the world?"
      puts "We have a few options for you to get you started! Ready? Go!"
    puts
 end

def show_options
    puts "What would like to do:".blue
    puts
    puts "1. Would you like to read some of your favorite actors-characters quotes"
    puts "2. Would you like to find some personal info on your favorite actors "
    puts "3. Would you like to take a look at all of your favorite actor's movies"
    puts "4. Would you like to add a new actor to our app?"
    puts "5. Would you like to delete one of the actors"
    puts "6. Would you like to update any info on one of the actors?"
    puts "7. Exit the app"
    puts "8. Add an actor to a movie"
    puts

    choice = gets.strip

    if choice == "1"
      say_quote
     elsif choice == "2"
       fav_actor
     elsif choice == "3"
       actors_movies_and_genres
     elsif choice == "4"
      create_an_actor
     elsif choice == "5"
      delete_an_actor
     elsif choice == "6"
      update_info_actor
     elsif choice == "7"
      puts "Thanks for stopping by. See You next Time!".bold
      exit
     elsif choice == "8"
      cast_actor_to_movie
    end
  puts "What would you like to do next?".light_blue
  puts "Type 'continue' to browse longer, or 'exit' to exit the app:"

  answer = gets.strip

    if answer == "continue"
       show_options
    else answer == "exit"
      puts "Thanks for stopping by. See You next Time!".light_blue
      exit
    end
end


def say_quote
  puts "Choose one of your favorite actor from the following list: ".blue.bold
  show_actor_list
  # get input from user
  input = gets.strip

# check if the input matches our database
  if show_actor_list.include?(input)
    actor = Actor.find_by(name: input)
    puts actor.list_characters_name
    # puts "Select one of the characters from the list to see it/s favorite quote:"
    # say_quote
    puts "This are all of your actor charaters. Pick one and type the name below: "
    puts
    answer = gets.strip
    char = Role.find_by(name: answer)
    # check if the characters name belongs to my actor-characters list
       if !char
       puts "Character not in the list. Let's start again!".blue
       # puts actor.list_characters_name
       say_quote
      else
         puts char.say_that_thing_you_say.bold
     end

  else
    puts "Sorry, I didn't get that. Please try again".red
    say_quote
  end

 end
#
def fav_actor
  show_actor_list
  puts
  puts "What's your pick?".bold
  answer = gets.strip
  actor = Actor.find_by(name: answer)
   if !actor
      puts "Sorry, we don't have that actor in our records. Please pick a diffrent name.".bold
      fav_actor
    else
      puts " Actors full name is  #{actor.name} and has a #{actor.gender} gender. Born in #{actor.country_of_origin}. Won #{actor.num_of_oscars_won} Oscars. Actor's income for last year was $#{actor.net_income}."
   end
end
#

 def create_an_actor
  puts "What is the actor's name?"
    name = gets.strip
    puts "What is your actor's age?"
    age = gets.strip
    puts "What is your actor's gender?"
    gender = gets.strip
    puts "Who is the actor's manager"
    manager = gets.strip
    puts "How many Oscars does your artist have? "
    num_oscars = gets.strip
    puts "What is your actor's country of origin: "
    country = gets.strip
    puts "What is your actor's height(ft. only)"
    height = gets.strip
    puts "What is your actor's income:"
    income = gets.strip

  attributes = {
      name: name,
      age: age,
      gender: gender,
      manager: manager,
      num_of_oscars_won: num_oscars,
      country_of_origin: country,
      height: height,
      net_income: income
  }
  actor = Actor.new(attributes)
  actor.save
  puts "Created", actor.name
  show_options
end

def delete_an_actor
  puts "What is the actor's name that you would like to delete?"
  show_actor_list
  answer = gets.strip
  actor = Actor.find_by(name: answer)
    if !actor
      puts "Sorry, that actor does not belong in our database".blue
      show_options
    else
      actor.delete
    end
end

def update_info_actor
  puts "What is the name of the actor you are looking for?"
  show_actor_list
  answer = gets.strip
  actor= Actor.find_by(name: answer)
   if !actor
     puts "Sorry, that actor does not belong to our database"
     update_info_actor
   end
  puts "What info would you like to update?"
    puts "1. name"
    puts "2. country of origin "
    puts "3. nums of oscars won "
    puts "4. net income "
    puts "5. age"
    puts "6. changed my mind"

   choice = gets.strip

   puts "What is the new value?"
   value = gets.strip

  if choice == "1"
    actor.update(name: value)
    actor.save
    elsif choice == "2"
      actor.update(country_of_origin: value)
      actor.save
    elsif choice == "3"
      actor.update(num_of_oscars_won: value)
      actor.save
    elsif choice == "4"
      actor.update(net_income: value)
      actor.save
    elsif choice == "5"
      actor.update(age: value)
      actor.save
    elsif choice == "6"
     show_options
  end
    puts "Would you like to update any other info?"
    puts "yes"
    puts "no"

    get_yes_or_no_from_user = gets.strip

    if get_yes_or_no_from_user == "yes"
      update_info_actor
     else
      puts "Cool, we're done here"
    end
  end


  def actors_movies_and_genres
   puts "What is your favorite actor? Pick one from the list and type his name below: "
   show_actor_list

   answer = gets.strip
   a = Actor.find_by(name: answer)
   puts a.all_movies_and_genres
   puts
   puts " The movie with the highest REVENUES for this actor was: ".light_blue
   puts
   puts a.movie_with_highest_revenues
   puts
   puts "Some of the most RECENT MOVIE/MOVIES, released after 2015: ".light_blue
   puts
   puts a.recent_movies

end


 def cast_actor_to_movie
   puts "Here we have a list of movies. What is your movie pick?"
   show_movie_list
   movie_pick = gets.strip
   puts "What is the  actor you like to add to the movie? "
   show_actor_list
   actor_pick = gets.strip

   puts "What is your character name?"
   character_name = gets.strip

   role = Role.new(name: character_name, movie: Movie.find_by(title: movie_pick), actor: Actor.find_by(name: actor_pick))
   role.save

 end
