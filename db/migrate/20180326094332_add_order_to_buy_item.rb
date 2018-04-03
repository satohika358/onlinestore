class AddOrderToBuyItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :buy_items, :order, foreign_key: true
  end
end
