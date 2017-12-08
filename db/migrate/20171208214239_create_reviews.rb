class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
