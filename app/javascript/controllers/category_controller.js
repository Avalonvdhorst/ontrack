import { Controller } from "@hotwired/stimulus"
let fieldId = 1;

export default class extends Controller {
  static targets = ["field"]

  add() {
    const lastField = this.fieldTargets[this.fieldTargets.length - 1];
    const form_html = lastField.outerHTML
    lastField.insertAdjacentHTML("afterend", form_html)
    lastField.children[0].children[0].name = lastField.children[0].children[0].name.replace(/\d/, fieldId);
    lastField.children[1].children[0].name = lastField.children[1].children[0].name.replace(/\d/, fieldId);
    lastField.children[2].children[0].name = lastField.children[2].children[0].name.replace(/\d/, fieldId);
    fieldId += 1;
  }
}
