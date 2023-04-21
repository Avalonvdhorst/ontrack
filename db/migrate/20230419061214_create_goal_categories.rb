class CreateGoalCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :goal_categories do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
