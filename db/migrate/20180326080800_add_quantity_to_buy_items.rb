class AddQuantityToBuyItems < ActiveRecord::Migration[5.1]
  def change
    add_column :buy_items, :quantity, :integer, default: 1
  end
end
