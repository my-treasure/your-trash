import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {

  static targets = ['filtercontainer', 'profileiconcontainer']

  connect() {
    console.log("Hello from filter")
    console.log(this.profileiconcontainerTarget)
  }

  toggleFilter(){
    if (this.filtercontainerTarget.classList.contains("hiddennav")){
      this.filtercontainerTarget.classList.remove("hiddennav")
    } else {
      this.filtercontainerTarget.classList.add("hiddennav")
    }
  }

  toggleProfileicon(){
    if (this.profileiconcontainerTarget.classList.contains("hiddennav")){
      this.profileiconcontainerTarget.classList.remove("hiddennav")
    } else {
      this.profileiconcontainerTarget.classList.add("hiddennav")
    }
    
  }
}
