class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :abv
      t.text :description
      t.string :style
      t.string :brewery
      t.string :location
      t.boolean :is_organic
    end
  end
end
