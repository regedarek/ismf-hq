import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['answers', 'answer']

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
        } else {
          this.answerTargets.forEach(element => { 
            if (!element.classList.contains('btn-success')) {
              element.classList.add('btn-danger')
            }
          })
        }
      })
      .catch(console.error);
  }
}
