class Category < ActiveRecord::Base
  validates :name, 
    presence: { message: "must be given please" },
    uniqueness: true
  
  has_many :products
end
