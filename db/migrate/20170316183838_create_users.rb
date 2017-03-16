class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :encrypted_password
      t.string :salt

      t.timestamps null: false
    end
  end
end
