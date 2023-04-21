# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'date'

GoalCategory.destroy_all
Category.destroy_all
User.destroy_all
SubGoal.destroy_all
Goal.destroy_all
Frequency.destroy_all

puts "Creating users"

puts "Creating frequencies"

['day', 'week', 'month', 'year'].each do |frequency|
  Frequency.create!(
    name: frequency
  )
end

puts "Done!"
puts "Creating goals"

Goal.create!(
  name: "Do yoga",
  start_date: Date.today,
  end_date: Date.today + 14,
  status: 'in progress',
  occurence: 3,
  frequency_id: Frequency.second.id
)

Goal.create!(
  name: "Duolingo Bahasa",
  start_date: Date.today,
  status: 'In progress',
  occurence: 1,
  frequency_id: Frequency.first.id
)

project = Goal.create!(
  name: "On Track Project",
  start_date: Date.today,
  end_date: Date.today + 2.months,
  status: 'in progress'
)

puts "Done"
puts "Creating subgoals"

SubGoal.create!(
  name: "Choose color scheme",
  start_date: Date.today,
  end_date: Date.today,
  status: "Completed",
  goal_id: project.id
)

SubGoal.create!(
  name: "Choose fonts",
  start_date: Date.today,
  end_date: Date.today + 1,
  status: "In progress",
  goal_id: project.id
)

SubGoal.create!(
  name: "Create database",
  start_date: Date.today,
  end_date: Date.today,
  status: "Completed",
  goal_id: project.id
)

puts "Done!"
puts "Creating Categories"

["Mental Health", "Physical Well-being", "Productivity", "Learning", "Career Growth", "Better Sleep"].each do |category|
  Category.create!(
    name: category
  )
end

puts "Done!"
puts "Creating Goal Categories"

GoalCategory.create!(
  goal_id: Goal.first.id,
  category_id: Category.first.id,
  score: 5
)

GoalCategory.create!(
  goal_id: Goal.first.id,
  category_id: Category.second.id,
  score: 7
)

GoalCategory.create!(
  goal_id: Goal.second.id,
  category_id: Category.fourth.id,
  score: 2
)

GoalCategory.create!(
  goal_id: Goal.third.id,
  category_id: Category.third.id,
  score: 20
)

GoalCategory.create!(
  goal_id: Goal.third.id,
  category_id: Category.fifth.id,
  score: 15
)

puts "Done! 🥳"
