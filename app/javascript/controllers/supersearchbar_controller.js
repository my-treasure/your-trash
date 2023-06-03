import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="supersearchbar"
export default class extends Controller {

  static targets = ["button", "input"]

  connect() {
    console.log(this.inputTarget)
  }

  clickMe(event){
    event.preventDefault()
    console.log("I have been clicked")
    console.log(this.inputTarget.value)
    this.inputTarget.value = " "
  }
}
