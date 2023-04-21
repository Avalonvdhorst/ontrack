class AddNullTrueToGoalFrequencyReference < ActiveRecord::Migration[7.0]
  def change
    change_column_null :goals, :frequency_id, true
  end
end
