import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkmark"
export default class extends Controller {
  static targets = ["checkmark"]
  check(event) {
    event.currentTarget.nextElementSibling.classList.remove("d-none")
    event.currentTarget.classList.add("d-none");
    const goalId = event.currentTarget.parentElement.dataset.goalId
    // Make an AJAX request to update the model's status attribute
    // fetch(`/models/${modelId}/update_status`, {
    //   method: "PUT",
      // headers: {
      //   "Content-Type": "application/json",
      //   "X-CSRF-Token": Rails.csrfToken() // If you're using Rails' built-in CSRF protection
      // },
    //   body: JSON.stringify({ status: "completed" })
    // })
    fetch(`/goals/${goalId}/update_status`, { method: 'PATCH' });
  }
}
