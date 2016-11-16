class Product < ActiveRecord::Base

  belongs_to :category
  has_many :reviews, dependent: :destroy

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
