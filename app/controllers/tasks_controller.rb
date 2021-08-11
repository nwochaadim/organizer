class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: %i[show update destroy]

  def new
    @task = Task.new
  end

  def index
    @q = current_user.tasks.not_deleted.ransack(params[:q])
    @tasks = @q.result
  end

  def show; end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      @task.task_memberships.create(user_id: current_user.id)
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task successfully updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @task.soft_delete
    redirect_to tasks_path
  end

  private

  def set_task
    @task = current_user.tasks.not_deleted.find(params[:id])
  end

  def task_params
    params
      .require(:task)
      .permit(:name, :notes, :starts_at, :completed_at)
  end
end
