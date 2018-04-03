require 'rails_helper'

RSpec.describe Cart, type: :model do

  fixtures :items
  subject(:cart) { Cart.new }
  
  let(:book_one) { items(:ruby) }
  let(:book_two) { items(:two) }
  
  describe "#add_item" do
    context "adding unique products" do
      before do
        cart.add_item(book_one).save!
        cart.add_item(book_two).save!
      end
      it "has two buy items" do
        expect(cart.buy_items.size).to eq(2)
      end
      it "has a total price of the two items' price" do
        expect(cart.total_price).to eq(book_one.price + book_two.price)
      end
    end

    context "adding duplicate products" do
      before do
        cart.add_item(book_one).save!
        cart.add_item(book_one).save!
      end
      it "has one buy item" do
        expect(cart.buy_items.size).to eq(1)
      end
      it "has a buy item with a quantity of 2" do
        expect(cart.buy_items.first.quantity).to eq(2)
      end
      it "has a total price of twice the product's price" do
        expect(cart.total_price).to eq(book_one.price * 2)
      end
    end
  end
end
