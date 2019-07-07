class Album < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs
  belongs_to :genre

#return the genre of the album
  def get_genre_name
    self.genre.name
  end

#return the number of songs associated
  def song_count
    self.songs.count
  end


  def years
    self.year
  end

  def rating_album
    self.rating
  end

end
