class AddFirstLastToUser < ActiveRecord::Migration
  def change
    remove_column :users, :name
    add_column :users, :first, :string
    add_column :users, :last, :string
  end
end
