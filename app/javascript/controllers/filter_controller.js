import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {

  static targets = ['filtercontainer']

  connect() {
    console.log("Hello from filter")
    console.log(this.filtercontainerTarget)
  }

  toggleFilter(){
    if (this.filtercontainerTarget.classList.contains("hiddennav")){
      this.filtercontainerTarget.classList.remove("hiddennav")
    } else {
      this.filtercontainerTarget.classList.add("hiddennav")
    }
  }
}
