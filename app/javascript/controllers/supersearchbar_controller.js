import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="supersearchbar"
export default class extends Controller {

  static targets = ["button", "input"]

  connect() {
    console.log(this.inputTarget)
  }

  clickMe(event){
    event.preventDefault()
    this.inputTarget.value = ""
  }
}
