require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.create
    @book_one = items(:ruby)
    @book_two = items(:two)
  end

  test "add unique items" do
    @cart.add_item(@book_one).save!
    @cart.add_item(@book_two).save!
    assert_equal 2, @cart.buy_items.size
    assert_equal @book_one.price + @book_two.price, @cart.total_price
  end

  test "add duplicate product" do
    @cart.add_item(@book_one).save!
    @cart.add_item(@book_one).save!
    assert_equal 2*@book_one.price, @cart.total_price
    assert_equal 1, @cart.buy_items.size
    assert_equal 2, @cart.buy_items[0].quantity
  end
end
