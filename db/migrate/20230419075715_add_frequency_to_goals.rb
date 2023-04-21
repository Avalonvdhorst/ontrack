class AddFrequencyToGoals < ActiveRecord::Migration[7.0]
  def change
    add_reference :goals, :frequency, null: false, foreign_key: true
  end
end
