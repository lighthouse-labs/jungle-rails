class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :product_id
      # t.integer :user_id
      t.string :description
      t.integer :rating
      
      t.timestamps :created_at
      t.timestamps :updated_at
    end
  end
end
