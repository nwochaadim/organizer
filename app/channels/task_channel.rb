class TaskChannel < ApplicationCable::Channel

  def subscribed
    stream_from "task_#{params[:task_id]}"
  end

end
