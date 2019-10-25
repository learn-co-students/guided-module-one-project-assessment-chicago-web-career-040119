class CreateTaprooms < ActiveRecord::Migration[5.2]
  def change
    create_table :taprooms do |t|
      t.integer :user_id
      t.integer :beer_id
      t.boolean :is_loved
    end
  end
end
