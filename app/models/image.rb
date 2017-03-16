class Image < ActiveRecord::Base

  mount_uploader :file, ProductImageUploader

  belongs_to :product

  validates :file, presence: true
  validates :product, presence: true

end
