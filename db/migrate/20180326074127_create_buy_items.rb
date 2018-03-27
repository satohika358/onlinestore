class CreateBuyItems < ActiveRecord::Migration[5.1]
  def change
    create_table :buy_items do |t|
      t.references :item, foreign_key: true
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
