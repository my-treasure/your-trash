import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

// Connects to data-controller="star-rating"
export default class extends Controller {

  static targets = [""]


  connect() {
    // new StarRating(this.element)
    // const stars = document.querySelectorAll("span.gl-star-rating--stars span")
    // stars.forEach((s) => {
    //   s.addEventListener("click", () => {
    //     console.log("clicked")
    //     this.element.submit();
    //   })
    // })
    this.stars = new StarRating(this.element, {tooltip: false})

    console.log("Hello")
  }
}
