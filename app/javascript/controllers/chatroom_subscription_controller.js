import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = { chatroomId: Number }

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
  }

  // Private
  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
  event.target.reset()
  }

  disconnect() {
  console.log("Unsubscribed from the chatroom")
  this.channel.unsubscribe()
  }
}
