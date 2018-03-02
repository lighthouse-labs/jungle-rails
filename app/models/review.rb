class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validate :rating_or_description

  private

  def rating_or_description
    if !description? && !rating?
      errors.add(:description, 'A review must have a review, rating or both')
      errors.add(:rating, 'A review must have a review, rating or both')
    end
  end
end
