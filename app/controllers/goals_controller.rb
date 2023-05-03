class GoalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @goals = Goal.where(frequency_id: nil)
    if params[:date]
      @goals = Goal.left_outer_joins(:sub_goals)
                   .where("goals.end_date = ? OR sub_goals.end_date = ?", params[:date], params[:date])
    end
    @goal_events = Goal.where.not(end_date: nil)
    @sub_goal_events = SubGoal.where.not(end_date: nil)

    @habits = Goal.where.not(frequency_id: nil)
    respond_to do |format|
      format.html
      format.text { render partial: "goals/goals", locals: { goals: @goals }, formats: [:html] }
    end
  end

  def new
    @goal = Goal.new(categories: [Category.new])
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.frequency_id = Frequency.find(params[:goal][:frequency_id].to_i).id if params[:goal][:frequency_id] != ""
    @goal.start_date = Date.today
    @goal.status = "in progress"
    determine_categories

    if @goal.save
      redirect_to goals_path
    else
      render 'new'
    end
  end

  def update_status
    @goal = Goal.find(params[:id])
    @goal.update(status: 'completed')

    head :no_content
  end

  private

  def goal_params
    params.require(:goal).permit(:end_date, :name, :occurence)
  end

  def determine_categories
    if params[:goal][:categories_attributes]
      params[:goal][:categories_attributes].each do |_key, cat_attr|
        if cat_attr[:name] != [] && cat_attr[:id] == ""
          category = Category.find(cat_attr[:id].to_i)
          create_goal_category(category, cat_attr)
        elsif cat_attr[:name] == [] && cat_attr[:id] != ""
          create_category(cat_attr)
        end
      end
    end
  end

  def create_category(cat_attr)
    category = Category.create(
      name: cat_attr[:name],
      score: 0
    )
    create_goal_category(category, cat_attr)
  end

  def create_goal_category(category, cat_attr)
    GoalCategory.create(
      category_id: category.id,
      goal_id: @goal.id,
      score: cat_attr[:goal_category][:score]
    )
  end
end
