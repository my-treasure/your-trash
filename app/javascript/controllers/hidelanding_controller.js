import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hidelanding"
export default class extends Controller {
  static targets = ['landingcontainer']

  connect() {
        console.log("hide landing controller connected 🕶️");
        console.log(this.landingcontainerTarget);
  }

  hideIt(){
    this.landingcontainerTarget.classList.add("landing-hidden");
  }
}
