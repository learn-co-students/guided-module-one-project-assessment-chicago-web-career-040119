class Artist < ActiveRecord::Base
#can build its associated songs
  has_many :songs
#can build its associated albums through its songs
  has_many :albums, through: :songs
#list artist name
  def artist_name
    self.name
  end

    def artist_age
      self.age
    end

    def artist_gender
      self.gender
    end

    def artist_country_of_origin
      self.country_of_origin
    end

    def artist_income
      self.income
    end

    def artist_num_grammys
      self.num_grammys
    end

#list all off its songs and albums
  def list_songs_and_albums
    self.songs.map do |songs|
       "Song: #{songs.name} Album: #{songs.album.name}" + "\n"
   end
  end

  def list_songs
    self.songs.map do |song|
      song.name
    end
  end

  def rating_album_for_artist
    self.albums.map do |album|
      album.rating
    end
 end

  def rich_artist
    Artist.where('income > 500000000').map do |artist|
      artist.name
    end
  end

 end
