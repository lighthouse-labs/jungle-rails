class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.text :description
      t.integer :rating
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
