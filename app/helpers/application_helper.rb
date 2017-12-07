module ApplicationHelper

  def product_sold_out?(productID)
    @inventory = Product.find(productID)
    if(@inventory.quantity === 0)
      return 'SOLD OUT!'
    end
  end

end
