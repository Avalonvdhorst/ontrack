import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field"]
  connect() {
    console.log("Hello from hello controller")
    console.log(this.fieldTarget)
  }
}
