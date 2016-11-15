class Rating < ActiveRecord::Base
  belongs_to :product

  validates :content, presence: true, length: { maximum: 500 }
  validates :rating , presence: true , numericality: {greater_than:0, less_than: 6, only_integer: true}
end
