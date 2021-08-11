class TaskMembershipsController < ApplicationController
  before_action :set_task
  before_action :set_collaborators

  def new
    @membership = @task.task_memberships.new
  end

  def create
    @membership = @task.task_memberships.new(membership_params)

    if @membership.save
      redirect_to tasks_path, notice: 'Collaborator added!'
    else
      render 'new'
    end
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_collaborators
    current_members = @task.task_memberships.pluck(:user_id)
    @collaborators = User.where.not(id: current_members)
  end

  def membership_params
    params.require(:task_membership).permit(:user_id)
  end
end
