import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profiledropdown"
export default class extends Controller {

  static targets = ['profiledropdowncontainer']

  connect() {
    console.log("Hello from profiledropdown")
  }
}
