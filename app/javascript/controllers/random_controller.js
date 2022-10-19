import { Controller } from "@hotwired/stimulus"
import confetti from "canvas-confetti"

export default class extends Controller {
  static targets = ['answers', 'answer', 'next', 'failure']

  connect() {
    this.nextTarget.classList.add('d-none')
  }

  check(event) {
    event.preventDefault()
    console.log("checking...")

    fetch(event.params.answerUrl)
      .then(response => response.json())
      .then((data) => {
        if (data.correct) {
          this.answerTargets.forEach(element => { 
            element.classList.add('btn-danger')
          })
          event.target.classList.remove('btn-danger')
          event.target.classList.add('btn-success')
          this.nextTarget.classList.remove('d-none')
          this.failureTarget.classList.add('d-none')
          confetti({
            particleCount: 70,
            angle: 120,
            spread: 65,
            origin: { x: 1 }
          })
        } else {
          this.answerTargets.forEach(element => { 
            if (!element.classList.contains('btn-success')) {
              element.classList.add('btn-danger')
            }
          })
          this.nextTarget.classList.add('d-none')
          this.failureTarget.classList.remove('d-none')
        }
      })
      .catch(console.error);
  }
}
