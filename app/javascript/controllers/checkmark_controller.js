import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkmark"
export default class extends Controller {
  static targets = ["checkmark"]
  check(event) {
    event.currentTarget.nextElementSibling.classList.remove("d-none")
    event.currentTarget.classList.add("d-none");
    const goalId = event.currentTarget.parentElement.dataset.goalId
    const subGoalId = event.currentTarget.parentElement.dataset.subGoalId
    if (goalId) {
      fetch(`/goals/${goalId}/update_status`, { method: 'PATCH' });
    } else if (subGoalId) {
      const parentId = event.currentTarget.parentElement.dataset.parentId
      fetch(`/goals/${parentId}/sub_goals/${subGoalId}/update_status`, { method: 'PATCH' });
    }
  }
}
