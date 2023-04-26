import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field"]

  add() {
    const form_html = this.fieldTargets[this.fieldTargets.length - 1].outerHTML
    this.fieldTargets[this.fieldTargets.length - 1].insertAdjacentHTML("afterend", form_html)
  }
}
