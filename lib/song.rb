class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
#return genre for associated song
  def song_genre
    self.album.genre
  end
#if artist return artist for song
  def artist_name
    self.artist.name
  end

  def album_name
    self.album.name
  end

  def song_name
    self.name
  end
end
