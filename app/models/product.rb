class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def self.average_rating(product_id)
    product_reviews = Product.find(product_id).reviews
    if product_reviews.count > 0
      product_reviews.all.sum('rating') / product_reviews.count
    else 
      return 0
    end
  end
  Product.find(24).reviews.all.sum('rating') / Product.find(24).reviews.count


end
