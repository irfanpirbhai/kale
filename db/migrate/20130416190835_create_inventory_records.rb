class CreateInventoryRecords < ActiveRecord::Migration
  def change
    create_table :inventory_records do |t|
      t.integer :price_cents, :null => false
      t.references :vendor, :null => false
      t.references :item, :null => false

      t.timestamps
    end
    add_index :inventory_records, :vendor_id
    add_index :inventory_records, :item_id
  end
end
