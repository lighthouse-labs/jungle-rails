class AddReviewToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :review, index: true, foreign_key: true
  end
end
