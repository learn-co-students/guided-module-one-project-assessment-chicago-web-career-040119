class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.integer :rating
      t.integer :revenues
      t.integer :num_albums_sold
      t.integer :genre_id
    end
  end
end
