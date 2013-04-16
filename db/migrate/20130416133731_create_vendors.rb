class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name, :null => false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone, :limit => 30

      t.timestamps
    end
  end
end
