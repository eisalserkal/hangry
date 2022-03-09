import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('Connected to request submit controller')
  }

  submit() {
    console.log(this.element)
  }
}
