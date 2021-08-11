class CommentsController < ApplicationController
  before_action :set_task

  def new
    @comment = @task.comments.new
  end

  def create
    @comment = @task.comments.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to @task, notice: 'Comment added successfully!'
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
