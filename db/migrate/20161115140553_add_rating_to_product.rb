class AddRatingToProduct < ActiveRecord::Migration
  def change
    add_column :products, :overallrating, :integer
  end
end
