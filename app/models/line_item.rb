class LineItem < ActiveRecord::Base
  #Associations
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  #Compute total price
  def total_price
  	product.price * quantity
  end
  
end
