class Goal < ApplicationRecord
  has_many :goal_categories
  has_many :categories, through: :goal_categories
  accepts_nested_attributes_for :goal_categories, :categories
  has_many :sub_goals
  has_many :goal_occurences
  belongs_to :frequency, optional: true

  COLORS = ["#FCEBD4", "#FFF8D3"]
end
