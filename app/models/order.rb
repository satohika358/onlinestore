class Order < ApplicationRecord
  has_many :buy_items, dependent: :destroy

  enum pay_type: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  def add_buy_items_from_cart(cart)
    cart.buy_items.each do |i|
      i.cart_id = nil
      buy_items << i
    end
  end
end
