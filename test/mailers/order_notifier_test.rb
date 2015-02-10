require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Shop Around Order Confirmation", mail.subject
    assert_equal ["alaa.abdulmawla@gmail.com"], mail.to
    assert_equal ["alaa.abdulmawla@gmail.com"], mail.from
    assert_match /1 x MyString/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Shop Around Order Shipped", mail.subject
    assert_equal ["alaa.abdulmawla@gmail.com"], mail.to
    assert_equal ["alaa.abdulmawla@gmail.com"], mail.from
    assert_match /<td>&times;1<\/td>/, mail.body.encoded
  end

end
