import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="items-index-page"
export default class extends Controller {
  static targets = ["foundFilter", "viewedFilter"]

  filter(event) {
    const form = event.target.closest("form");
    if (form) {
      form.requestSubmit();
      this.showLoading();
    }
  }

  connect() {
    this.element.addEventListener("turbo:frame-load", this.hideLoading);
  }

  disconnect() {
    this.element.removeEventListener("turbo:frame-load", this.hideLoading);
  }

  showLoading() {
    const loading = document.getElementById("items-list-loading");
    const list = document.getElementById("items-list-list");
    if (loading) {
      loading.classList.remove("hidden");
    }
    if (list) {
      list.classList.add("hidden");
    }
  }

  hideLoading() {
    const loading = document.getElementById("items-list-loading");
    const list = document.getElementById("items-list-list");
    if (loading) {
      loading.classList.add("hidden");
    }
    if (list) {
      list.classList.remove("hidden");
    }
  }
}
