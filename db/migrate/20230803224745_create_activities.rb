class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :user_id
      t.string :type
      t.string :date
      t.string :detail
      t.string :carbon_footprint

      t.timestamps
    end
  end
end
