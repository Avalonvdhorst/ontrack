class CreateSubGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_goals do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :occurence

      t.timestamps
    end
  end
end
