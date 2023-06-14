// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="unread-messages"
// export default class extends Controller {
//   static targets = ["count"];

//   connect() {
//     this.updateUnreadCount();
//   }

//   updateUnreadCount() {
//     const count = this.data.get("count");
//     this.countTarget.innerText = count;
//   }
// }


import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["count"]

  connect() {
    // Subscribe to the UnreadMessagesChannel
    console.log("Subscribe to the UnreadMessagesChannel")
    this.channel = createConsumer().subscriptions.create(
      { channel: "UnreadMessagesChannel" },
      { received: data => this.#updateUnreadMessages(data.count) }
    )
    console.log(this.channel)
  }

  // Private
  #updateUnreadMessages(count) {
    this.count.innerHTML = count;
    if (parseInt(count) > 0) {
      this.count.classList.add("active");
    } else {
      this.count.classList.remove("active");
    }
  }

  disconnect() {
    this.channel.unsubscribe()
  }
}
