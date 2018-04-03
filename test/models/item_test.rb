require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "item attributes must not be empty" do
    item = Item.new
    assert item.invalid?
    assert item.errors[:name].any?
    assert item.errors[:description].any?
    assert item.errors[:price].any?
  end

  test "item price must be positive" do
    item = Item.new(name: "My Book Title", description: "yyy")
    item.price = -1
    assert item.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    item.errors[:price]
    item.price = 0
    assert item.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    item.errors[:price]
    item.price = 1
    assert item.valid?
  end

  def new_product(image_url)
    Item.new(name: "My Book Title", description: "yyy", price: 1)
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end
  assert_redirected_to products_url
  end
  
  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end
  assert_redirected_to products_url
  end

end