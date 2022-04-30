class AddCategoryIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, index: true, foreign_key: true
  end
end
