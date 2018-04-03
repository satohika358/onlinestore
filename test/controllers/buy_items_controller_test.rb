require 'test_helper'

class BuyItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buy_item = buy_items(:one)
  end

  test "should get index" do
    get buy_items_url
    assert_response :success
  end

  test "should get new" do
    get new_buy_item_url
    assert_response :success
  end

  test "should create buy_item" do
    assert_difference('BuyItem.count') do
      post buy_items_url, params: { item_id: products(:ruby).id }
    end
    follow_redirect!
    assert_select 'h2', "Anna's Online Store"
    assert_select 'li', '1 \u00D7 Programming Ruby 1.9'
  end

  test "should show buy_item" do
    get buy_item_url(@buy_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_buy_item_url(@buy_item)
    assert_response :success
  end

  test "should update buy_item" do
    patch buy_item_url(@buy_item), params: { buy_item: { item_id: @buy_item.item_id } }
    assert_redirected_to buy_item_url(@buy_item)
  end

  test "should destroy buy_item" do
    assert_difference('BuyItem.count', -1) do
      delete buy_item_url(@buy_item)
    end

    assert_redirected_to buy_items_url
  end
end
