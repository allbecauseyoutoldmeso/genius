import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  drag(event) {
    this.codePeg = event.target.cloneNode(true)
  }

  allowDrop(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()
    const cell = event.target
    cell.appendChild(this.codePeg)
    const input = cell.getElementsByTagName('input')[0]
    input.value = this.codePeg.dataset.colour
  }
}
