class AddEmailToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :email, :string
  end
end
