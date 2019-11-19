# require "colorize"

class Actor < ActiveRecord::Base

  has_many :roles
  has_many :movies, through: :roles

  def list_name
    self.name
    # end
  end

  def list_gender
    self.gender
  end

  def list_characters_name
    self.roles.map do |role|
     role.name
    end
  end

  def age
    self.age
  end

  def all_movies_and_genres
     self.movies.map do |movie|
       "#{movie.title} - '#{movie.genre.name}'. This movie was directed by #{movie.director}, and it was released in #{movie.release_year}.
        It was filmed in #{movie.filming_location}, and the language spoken in the movie is #{movie.language_spoken}. It has won #{movie.num_of_oscars_won} Oscars, and has a rating of #{movie.rating} on Imdb."
     end
  end

  def movie_with_highest_revenues
     movie = self.movies.max_by  do |movie|
      movie.revenues
    end
    "#{movie.title} - had $#{movie.revenues} in revenues."
  end

  def recent_movies
    self.movies.where("release_year >= 2015").map do |movie|
      "#{movie.title}, directed by #{movie.director}, and it was released in #{movie.release_year}."
    end
  end

  # def movie_filming_location


end
