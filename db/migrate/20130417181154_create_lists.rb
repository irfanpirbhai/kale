class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :user, :null => false 

      t.timestamps
    end
    add_index :lists, :user_id
  end
end
