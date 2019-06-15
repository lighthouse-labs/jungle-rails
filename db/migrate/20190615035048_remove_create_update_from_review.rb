class RemoveCreateUpdateFromReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :createdat
    remove_column :reviews, :updatedat
  end
end
