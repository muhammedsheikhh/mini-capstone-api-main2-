class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :user_id
      t.string :description
      t.string :startdate
      t.string :enddate
      t.string :status
      t.string :achivemet

      t.timestamps
    end
  end
end
