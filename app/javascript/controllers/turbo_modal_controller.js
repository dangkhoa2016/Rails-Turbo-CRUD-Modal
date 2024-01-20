import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  connect() {
    document.addEventListener('turbo:submit-end', (event) => {

      // console.log('addEventListener turbo:submit-end', this.element);

      console.log('event.detail', event.detail);
      if (event.detail.success)
        this.hideModal();

    }, { once: true });
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
