class DeleteVendorPrices < ActiveRecord::Migration
  def up
    drop_table :vendorprices
  end

  def down
  end
end
