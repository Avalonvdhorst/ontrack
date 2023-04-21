class CreateGoalOccurences < ActiveRecord::Migration[7.0]
  def change
    create_table :goal_occurences do |t|
      t.references :goal, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
