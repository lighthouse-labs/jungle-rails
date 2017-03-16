class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true

  # CarrierWave
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :images

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
