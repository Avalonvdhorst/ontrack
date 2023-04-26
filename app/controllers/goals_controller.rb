class GoalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    raise
    @goal = Goal.new(goal_params)
    if params[:goal][:frequency_id] != ""
      @goal.frequency_id = Frequency.find(params[:goal][:frequency_id].to_i).id
    end

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
    params
      .require(:goal)
      .permit(
        :end_date, :name, :occurence,
        categories_attributes: [:custom_name],
        goal_categories_attributes: [:score]
      )
  end

  def create_category
    if params[:goal][:category][:name] != "" && params[:goal][:category][:custom_name] == ""
      category = Category.find(params[:goal][:category][:name].to_i)
      create_goal_category(category)
    elsif params[:goal][:category][:name] == "" && params[:goal][:category][:custom_name] != ""
      category = Category.create(
        name: (params[:goal][:category][:custom_name]),
        score: 0
      )
      create_goal_category(category)
    end
  end

  def create_goal_category(category)
    GoalCategory.create(
      category_id: category.id,
      goal_id: @goal.id,
      score: params[:goal][:goal_category][:score]
    )
  end
end
