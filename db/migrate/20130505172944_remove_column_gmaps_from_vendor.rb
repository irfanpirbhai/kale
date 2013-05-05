class RemoveColumnGmapsFromVendor < ActiveRecord::Migration
  def change
    remove_column :vendors, :gmaps
  end
end