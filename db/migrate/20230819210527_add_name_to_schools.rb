class AddNameToSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :name, :string
  end
end
