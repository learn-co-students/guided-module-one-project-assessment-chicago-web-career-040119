# require 'rest-client'
# require 'json'
# require 'pry'

require 'colorize'

  def greet
    puts "______________________________________________".black.bold
    puts " "
    puts "         WELCOME TO MUSIC INDUSTRY!".green.bold
    puts "______________________________________________".black.bold
  end

  def show_artist_list

    Artist.all.map do |artist_instance|
      artist_instance.artist_name
    end.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist}"
    end

  end

  def show_options
    greet

    puts ""
    puts "        What would you like to do?".red.bold
    puts "                                                 "
    puts "1. See your favorite artist's demographics".bold
    puts ""
    puts "2. See your favorite artist's songs, albums, rating and genre".bold
    puts ""
    puts "3. Say a song and I'll tell you the artist and the album".bold
    puts ""
    puts "4. Please add/enter a new artist".bold
    puts ""
    puts "5. Please update an artist's information".bold
    puts ""
    puts "6. Please delete an artist!".bold
    puts ""
    puts "7. Add a song to an existing artist".bold

    choice = gets.strip
        if choice == "1"
          see_details
        elsif choice == "2"
          see_favorite_artist_songs_albums_genre
        elsif choice == "3"
          say_artist_album_for_song
        elsif choice == "4"
          can_be_created_with_a_hash_of_attributes
        elsif choice == "5"
          can_be_found_updated_and_saved
        elsif choice == "6"
          can_destroy_a_single_item
        elsif choice == "7"
          add_song_to_artist
        else
       puts "Wrong input. Enter an option from 1 to 7!".bold.red
       puts ""
    end

 end

  def goodbye

      puts "Would you like to" + " play ".bold.red + "more? " + "yes/no ".bold.red
      user = gets.strip
      if user == "no"
        puts "Bye - bye "
        exit
      elsif user == "yes"
        show_options
      else
        puts "Enter" + " yes ".bold.red + "or" +  " no!"
        goodbye
      end

  end

  def see_details

    puts "Enter your artist name to see all details".bold
    puts ""
    show_artist_list

    answer = gets.strip
    a = Artist.find_by(name: answer)
    puts "Age"
    puts a.artist_age
    puts "Gender"
    puts a.artist_gender
    puts "Country of origin"
    puts a.artist_country_of_origin
    puts "Income"
    puts a.artist_income
    puts "Number of Grammys won"
    puts a.artist_num_grammys

    if (a.artist_income > 500000000)
      puts ""
      puts "Your Artist is filthy rich!".bold.red
    end
    puts ""
    goodbye

  end

  def see_favorite_artist_songs_albums_genre
    puts "Enter your artist name and I'll tell you all the songs and albums!".bold

    show_artist_list

    answer = gets.strip
    a = Artist.find_by(name: answer)
    puts a.list_songs_and_albums
    puts ""
    puts "Select an album to find its genre and rating!".bold
    puts ""
    answer_two = gets.strip
    b = Album.find_by(name: answer_two)

    puts b.get_genre_name
    puts b.rating_album

  end

  def can_be_created_with_a_hash_of_attributes
      puts "What is the artist's name?"
      name = gets.strip
      puts "What is your artist's age?"
      age = gets.strip
      puts "What is your artist's gender?"
      gender = gets.strip
      puts "What is your artist's country of origin: "
      country = gets.strip
      puts "What is your artist's income: "
      income = gets.strip
      puts "How many grammys does your artist have? "
      grammy = gets.strip

      attributes = {
        name: name,
        age: age,
        gender: gender,
        country_of_origin: country,
        income: income,
        num_grammys: grammy
      }
      artist = Artist.new(attributes)
      artist.save
      artist

  end

  def add_song_to_artist

    puts "Please choose your artist would you like to add the song to:"

    show_artist_list

    answer_two = gets.strip
    artist = Artist.find_by(name: answer_two)

    puts "Please enter your song name"
    answer_three = gets.strip
    song = Song.new(name: answer_three, artist: artist, album: Album.first)
    song.save
    song
  end

  def can_be_found_updated_and_saved

   puts "What is the name of the artist you would like to update infomation for?".bold

   show_artist_list

   answer = gets.strip
   artist = Artist.find_by(name: answer)

    puts "What's the information would you like to update?".bold
    puts ""
    puts "age"
    puts "gender"
    puts "country"
    puts "income"
    puts "grammy"

    answer = gets.strip
    if answer == "age"
      puts "Enter new age"
      age = gets.strip
      artist.update(age: age)
    elsif answer == "gender"
      puts "Enter new gender"
      gender = gets.strip
      artist.update(gender: gender)
    elsif answer == "country"
      puts "Enter new country"
      country = gets.strip
      artist.update(country: country)
    elsif answer == "income"
      puts "Enter new income"
      income = gets.strip
      artist.update(income: income)
    elsif answer == "grammy"
      puts "Enter new number"
      grammy = gets.strip
      artist.update(num_grammys: grammy)
    end
      artist.save
      puts "Updated #{artist.name}"

      goodbye
  end

  def can_destroy_a_single_item

    puts "What is the artist would you like to ".bold + "REMOVE?".bold.red

    show_artist_list

    answer = gets.strip
    artist = Artist.find_by(name: answer)
    if !artist
      puts "We are sorry but your artist is not in our list!".red.bold
    else
     artist.delete
     puts "Your artist was successfully deleted.".red.bold
    end

  end

  def say_artist_album_for_song

    Song.all.map do |song_instance|
      song_instance.song_name
    end.each_with_index do |song, i|
      puts "#{i + 1}. #{song}"
    end

     answer = gets.strip
     song = Song.find_by(name: answer)
     puts song.artist_name
     puts song.album_name
     goodbye
  end
