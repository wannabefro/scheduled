class Api::V1::TasksController < ApplicationController
  include Devise::Controllers::Helpers
  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      render json: @task, 
        status: :ok
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name)
  end
end
