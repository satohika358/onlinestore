class Cart < ApplicationRecord
  has_many :buy_items, dependent: :destroy

  def add_item(item)
    current_item = buy_items.find_by(item_id: item.id)
  if current_item
    current_item.quantity += 1
  else
    current_item = buy_items.build(item_id: item.id)
  end
    current_item
  end

  def total_price
    add_hi
    buy_items.to_a.sum { |i| i.total_price }
  end
  def add_hi
    puts "Hi"
  end
  handle_asynchronously :add_hi, :run_at => Proc.new { 10.seconds.from_now }
end