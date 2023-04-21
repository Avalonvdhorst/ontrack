class AddDefaultZeroToCategoryTotalScore < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :total_score, :integer, default: 0
  end
end
