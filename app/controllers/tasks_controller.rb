class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: %i[edit update destroy]

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
