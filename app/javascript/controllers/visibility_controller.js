import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="visibility"
export default class extends Controller {
  static targets = ["hideable", "cards", "map"];

  connect() {
    console.log("Hello from the📸 visibility controller 🫀🤖");
    console.log(this.mapTarget);
  }

  showTargets() {
    this.hideableTargets.forEach((el) => {
      el.hidden = false;
    });
  }

  hideTargets() {
    this.hideableTargets.forEach((el) => {
      el.hidden = true;
    });
  }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden;
    });
  }

  openMap() {
    this.mapTarget.classList.toggle("hideit");
  }
}
