class Category < ActiveRecord::Base
  validates :name, presence: { message: "must be given please" }
  
  has_many :products

end
