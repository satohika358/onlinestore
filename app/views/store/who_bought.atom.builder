atom_feed do |feed|
  feed.title "Who bought #{@item.name}"
  feed.updated @latest_order.try(:updated_at)
  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.address}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Item'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end
          order.buy_items.each do |i|
            xhtml.tr do
              xhtml.td i.product.title
              xhtml.td i.quantity
              xhtml.td number_to_currency i.total_price
            end
          end
          xhtml.tr do
            xhtml.th 'total', colspan: 2
            xhtml.th number_to_currency \
            order.buy_items.map(&:total_price).sum
          end
        end
        xhtml.p "Paid by #{order.pay_type}"
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end