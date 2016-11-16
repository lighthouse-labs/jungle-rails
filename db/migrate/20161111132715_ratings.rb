class Ratings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.string :description
      t.timestamps null: false
    end
  end
end
