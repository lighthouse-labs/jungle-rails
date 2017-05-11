class Category < ActiveRecord::Base
  has_many :products
  before_destroy :check_empty

  private
  def check_empty
    if products.any?
      raise  "Destroy aborted; there are products in the store"
    end
  end
end
