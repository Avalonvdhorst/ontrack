class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :occurence

      t.timestamps
    end
  end
end
