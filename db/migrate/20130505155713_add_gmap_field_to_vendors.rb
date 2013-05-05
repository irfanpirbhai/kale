class AddGmapFieldToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :gmaps, :boolean
  end
end
