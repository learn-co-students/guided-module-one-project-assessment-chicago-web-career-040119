class Genre < ActiveRecord::Base
  has_many :albums

  def album_count
    self.albums.count
  end

end
