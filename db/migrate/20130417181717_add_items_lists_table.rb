class AddItemsListsTable < ActiveRecord::Migration
 def change
    create_table :items_lists, :id => false do |t|
      t.integer :item_id
      t.integer :list_id
    end
  end
end