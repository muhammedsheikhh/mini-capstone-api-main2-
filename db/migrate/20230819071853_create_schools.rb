class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.integer :user
      t.integer :energy_consumption
      t.integer :waste_management
      t.integer :transportation
      t.integer :other_factors
      t.string :carbon_footprint

      t.timestamps
    end
  end
end
