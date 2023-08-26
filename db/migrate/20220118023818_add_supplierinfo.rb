class AddSupplierinfo < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :supplierinfo_id, :integer
  end
end
