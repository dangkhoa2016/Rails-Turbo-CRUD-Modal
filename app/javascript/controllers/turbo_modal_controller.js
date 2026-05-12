import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
    this.boundKeydown = this.handleKeydown.bind(this);
    window.addEventListener("keydown", this.boundKeydown);

    document.addEventListener('turbo:submit-end', (event) => {
      console.log('event.detail', event.detail);
      if (event.detail.success)
        this.hideModal();
    }, { once: true });
  }

  disconnect() {
    window.removeEventListener("keydown", this.boundKeydown);
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.hideModal();
    }
  }

  hideModal(event) {
    console.log('event', event);
    const back_to = this.element.querySelector("input[name='back_to']");
    if (back_to) {
      console.log('back_to', back_to);
      window.location = back_to.value;
    }

    if (this.element.parentElement)
      this.element.parentElement.removeAttribute("src");
    this.element.remove();
  }
}
