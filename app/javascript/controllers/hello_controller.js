import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello from the hello controller 🫣");
    this.element.textContent = "Hello World!"
  }
}
