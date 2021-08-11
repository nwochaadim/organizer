import { Controller } from 'stimulus'
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ['commentsBlock', 'taskId']

  initialize() {
    this.consumer = createConsumer();
  }

  connect() {
    const taskId = this.taskIdTarget.value
    this.consumer.subscriptions.create({ channel: 'TaskChannel', task_id: taskId },
      { received: this.onReceived }
    )
  }

  onReceived = (data) => {
    this.commentsBlockTarget.innerHTML += this.renderComment(data.comment)
  }

  renderComment(comment) {
    return `
      <div class='comment'>
        <div class='content'>
          <a class='author'>${comment['user_name']}</a>

          <div class='metadata'>
            <span class='date'>${comment['created_at']}</span>
          </div>
          <div class='text'>${comment['body']}</div>
        </div>
      </div>
    `;
  }

}
