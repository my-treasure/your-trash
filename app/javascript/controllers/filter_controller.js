import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {

  static targets = ['filtercontainer', 'profileiconcontainer']

  connect() {
  }

  // toggleFilter(){
  //   if (this.filtercontainerTarget.classList.contains("hiddennavsearch")){
  //     this.filtercontainerTarget.classList.remove("hiddennavsearch")
  //   } else {
  //     this.filtercontainerTarget.classList.add("hiddennavsearch")
  //   }
  // }

  toggleFilter() {
    this.filtercontainerTarget.classList.toggle("hiddennavsearch");
    // if (this.filtercontainerTarget.classList.contains("hiddennavsearch")) {
    //   this.filtercontainerTarget.addEventListener("transitionend", this.hideContainer);
    // } else {
    //   this.containerTarget.removeEventListener("transitionend", this.hideContainer);
    //   this.filtercontainerTarget.style.display = "block";
    // }
  }

  // hideContainer = () => {
  //   this.filtercontainerTarget.style.display = "none";
  // };

  toggleProfileicon(){
    this.profileiconcontainerTarget.classList.toggle("hiddennav");
  }
}
