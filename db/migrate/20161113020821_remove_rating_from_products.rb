class RemoveRatingFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :rating, :integer
  end
end
