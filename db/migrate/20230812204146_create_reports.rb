class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.date :date
      t.string :report_data
      t.string :recommendations

      t.timestamps
    end
  end
end
