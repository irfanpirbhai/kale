class DeleteVendorPrices < ActiveRecord::Migration
  def up
    drop_table :prices
  end

  def down
  end
end
