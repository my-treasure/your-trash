import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="supersearchbar"
export default class extends Controller {

  static targets = ["button", "input"]

  connect() {
    const searchForm = document.querySelector(".search-box");
    const searchInput = document.querySelector(".search-form");
    const searchButton = document.querySelector("#search-button");

    searchInput.addEventListener("keypress", function(event) {
      if (event.key === "Enter") {
        event.preventDefault();
        searchForm.submit();
      }
    });

    searchButton.addEventListener("click", function(event) {
      event.preventDefault();
      searchForm.submit();
    });
  }

  clickMe(event){
    event.preventDefault()
    this.inputTarget.value = ""
  }
}
