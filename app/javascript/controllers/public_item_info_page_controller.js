import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="public-item-info-page"
export default class extends Controller {
  static targets = ["foundItButton", "foundItForm"]

  showForm(event) {
    event.preventDefault()

    if (this.hasFoundItFormTarget) {
      this.foundItFormTarget.classList.remove("hidden")
      this.foundItButtonTarget.classList.add("hidden")
    }
  }

  hideForm(event) {
    event.preventDefault()

    if (this.hasFoundItFormTarget) {
      this.foundItFormTarget.classList.add("hidden")
      this.foundItButtonTarget.classList.remove("hidden")
    }
  }
}
