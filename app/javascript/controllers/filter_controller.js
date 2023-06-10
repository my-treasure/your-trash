import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {

  static targets = ['filtercontainer', 'profileiconcontainer']

  connect() {
    var slider = document.getElementById("myRange");
    var output = document.getElementById("output");

    // Update the current slider value (each time you drag the slider handle)
    slider.oninput = function () {
      output.innerHTML = this.value + " km";
    };
  }

  toggleFilter(e) {
    // e.preventDefault();
    e.stopPropagation();
    e.stopImmediatePropagation();
    console.log( this.filtercontainerTarget.classList)
    this.filtercontainerTarget.classList.toggle("hiddennavsearch");
    console.log( this.filtercontainerTarget.classList)

  }

  toggleProfileicon(e){
    e.stopPropagation();
    e.stopImmediatePropagation();
    this.profileiconcontainerTarget.classList.toggle("hiddennav");
  }
}
