import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
    this.boundKeydown = this.handleKeydown.bind(this);
    window.addEventListener("keydown", this.boundKeydown);
  }

  disconnect() {
    window.removeEventListener("keydown", this.boundKeydown);
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.hideModal();
    }
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }  
}
