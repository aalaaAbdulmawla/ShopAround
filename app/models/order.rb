class Order < ActiveRecord::Base
	#Associations
	has_many :line_items, dependent: :destroy

	#Select menu options
	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]

	#validations
	validates :name, :address, :email, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	#Empty the cart from line items to make an order 
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

end
