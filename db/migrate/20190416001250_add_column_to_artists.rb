class AddColumnToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :num_grammys, :integer
  end
end
