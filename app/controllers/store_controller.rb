class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    @items = Item.order(:price)
    moreitems = SimpleXlsxReader.open('db/moreitems.xlsx')
    @moreitems = []
    moreitems.sheets.first.rows.each do |i|
    	@moreitems << {name: i[0], description: i[1], image_url: i[2], price: i[3]}
    end
  end
end
