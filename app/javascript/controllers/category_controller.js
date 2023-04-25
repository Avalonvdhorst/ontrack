import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field"]

  add() {
    this.fieldTarget.classList.remove("d-none");

    // const html = "<%= escape_javascript(render partial: 'field', locals: { f: form_builder }) %>"
    // this.fieldTarget.insertAdjacentHTML("beforeend", html)
  }
}
