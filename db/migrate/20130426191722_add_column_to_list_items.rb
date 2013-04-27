class AddColumnToListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :list
      t.references :item
      t.references :inventory_record
      t.timestamps
    end
    add_index :list_items, :list_id
    add_index :list_items, :item_id
    add_index :list_items, :inventory_record_id

    drop_table :items_lists
  end
end



