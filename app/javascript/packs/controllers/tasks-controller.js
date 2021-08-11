import { Controller } from 'stimulus'
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ['commentsBlock']

  initialize() {
    this.consumer = createConsumer();
  }

  connect() {
    this.consumer.subscriptions.create({ channel: 'TaskChannel', task_id: 2 },
      { received: this.onReceived }
    )
  }

  onReceived = (data) => {
    this.commentsBlockTarget.innerHTML += this.renderComment(data.comment)
    console.log('received data', data);
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
