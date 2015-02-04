class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  #Compute total price
  def total_price
  	product.price * quantity
  end
  
end
