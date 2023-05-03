class SubGoalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update_status
    @sub_goal = SubGoal.find(params[:id])
    @sub_goal.update(status: 'completed')

    head :no_content
  end
end
