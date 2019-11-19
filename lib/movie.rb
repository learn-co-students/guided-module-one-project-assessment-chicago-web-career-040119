class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, through: :roles
  belongs_to :genre

  def list_movie_title
    self.title
  end

  def list_characters
    self.roles.map do |role|
      "#{role.name}"
    end
  end

  def list_actor
    self.actors.map do | actor |
      actor.name
    end
  end

 def all_female_actors
   self.actors.select do |actor|
     actor.gender == "Female"
   end
 end



end
