class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :price_cents, :null => false
      t.references :vendor, :null => false
      t.references :item, :null => false

      t.timestamps
    end
    add_index :prices, :vendor_id
    add_index :prices, :item_id
  end
end
