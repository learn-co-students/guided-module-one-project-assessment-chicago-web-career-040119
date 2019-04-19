class RemoveColumnLengthFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :length
  end
end
