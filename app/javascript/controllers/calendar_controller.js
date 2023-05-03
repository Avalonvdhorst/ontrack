import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ["day", "goals"]

  load(event) {
    const fullDate = event.currentTarget.dataset.fullDate
    console.log(fullDate);
    this.dayTargets.forEach((day => {
      day.classList.remove("current-day-marked")
    }))
    event.currentTarget.classList.add("current-day-marked")
    const url = `/goals?date=${fullDate}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        // console.log(data)
        this.goalsTarget.outerHTML = data
      })
  }
}
