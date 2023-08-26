class CreateSupplierinfos < ActiveRecord::Migration[7.0]
  def change
    create_table :supplierinfos do |t|
      t.string :name
      t.string :email
      t.integer :phone_number

      t.timestamps
    end
  end
end
