class Item < ApplicationRecord
  has_many :buy_items
  has_many :orders, through: :buy_items

  before_destroy :ensure_not_referenced_by_any_buy_item

  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true

  private
  def ensure_not_referenced_by_any_buy_item
    unless buy_items.empty?
      errors.add(:base, 'Buy Items present')
      throw :abort
    end
  end
end
