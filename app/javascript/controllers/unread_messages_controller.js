import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="unread-messages"
export default class extends Controller {
  static targets = ["count"];

  connect() {
    this.updateUnreadCount();
  }

  updateUnreadCount() {
    const count = this.data.get("count");
    this.countTarget.innerText = count;
  }
}
