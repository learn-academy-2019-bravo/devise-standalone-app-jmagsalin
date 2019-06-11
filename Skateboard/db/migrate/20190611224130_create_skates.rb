class CreateSkates < ActiveRecord::Migration[5.2]
  def change
    create_table :skates do |t|
      t.string :deck_brand
      t.string :trucks_brand
      t.integer :model_year
      t.integer :user_id

      t.timestamps
    end
  end
end
