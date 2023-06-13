import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {


  connect(){
    console.log("Hello from submit")
    console.log(this.element.querySelectorAll(".gl-star-rating"))
  }

  submit() {
    const stars = this.element.querySelectorAll("gl-star-rating")
    this.element.submit();
  }
}
