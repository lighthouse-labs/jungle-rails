module RenderHelper
  def sold_out?(productID)
    @inventory = Product.find(productID)
    if(@inventory.quantity === 0)
      return 'SOLD OUT!'
    else
      return 'AVAILABLE'
    end
  end
end
