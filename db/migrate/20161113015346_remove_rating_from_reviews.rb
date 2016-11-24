class RemoveRatingFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :rating, :integer
  end
end
