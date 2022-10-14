import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  check_answer(event) {
    event.preventDefault()
  }
}
