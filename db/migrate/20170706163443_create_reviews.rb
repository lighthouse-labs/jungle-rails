class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.references :product, index: true, foreign_key: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
