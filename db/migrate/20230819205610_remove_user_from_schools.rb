class RemoveUserFromSchools < ActiveRecord::Migration[7.0]
  def change
    remove_column :schools, :user, :integer
  end
end
