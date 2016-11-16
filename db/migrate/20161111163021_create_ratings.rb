class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :content
      t.integer :rating
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
