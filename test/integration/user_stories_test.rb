require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
	
	#A user goes to the index page. They select a product, adding it to their
	#cart, and check out, filling in their details on the checkout form. when
	#they submit, an order is created containing their information, along with a
	#single line item corresponding to the product they added to their cart.

	fixtures :products

	test "buying a product" do
		LineItem.delete_all
		Order.delete_all
		one = products(:one)

		get '/'
		assert_response :success
		assert_template "index"

		xml_http_request :post, '/line_items', product_id: one.id
		assert_response :success

		cart = Cart.find(session[:cart_id])
		assert_equal 1, cart.line_items.size
		assert_equal one, cart.line_items[0].product

		get "/orders/new"
		assert_response :success
		assert_template "new"

		post_via_redirect "/orders",
							order: { name: "Alaa Mohamed",
									address: "My Address",
									email: "alaa.abdulmawla@gmail.com",
									pay_type: "Check"}

		assert_response :success
		assert_template "index"
		cart = Cart.find(session[:cart_id])
		assert_equal 0, cart.line_items.size

		orders = Order.all
		assert_equal 1, orders.size
		order = orders[0]

		assert_equal "Alaa Mohamed", 			  order.name
		assert_equal "My Address", 				  order.address
		assert_equal "alaa.abdulmawla@gmail.com", order.email
		assert_equal "Check",					  order.pay_type

		assert_equal 1, order.line_items.size
		line_item = order.line_items[0]
		assert_equal one, line_item.product

		mail = ActionMailer::Base.deliveries.last
		assert_equal ["alaa.abdulmawla@gmail.com"], 	mail.to
		assert_equal 'alaa.abdulmawla@gmail.com', 		mail[:from].value
		assert_equal "Shop Around Order Confirmation", 	mail.subject
	end
		
end
