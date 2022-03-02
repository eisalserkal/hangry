import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["restaurant", "menu", "waiter", "cover" ]
  connect() {
    console.log("hello from pagination_controller!")
  }

  restaurant(event) {
    console.log('restaurant')
    event.preventDefault()

    this.menuTarget.classList.add('d-none')
    this.waiterTarget.classList.add('d-none')
    this.coverTarget.classList.add('d-none')
    if (this.restaurantTarget.classList.contains('d-none')) {
      this.restaurantTarget.classList.remove('d-none')
    }
  }

  menu(event) {
    console.log('menu')
    event.preventDefault()
    this.restaurantTarget.classList.add('d-none')
    this.waiterTarget.classList.add('d-none')
    this.coverTarget.classList.add('d-none')
    if (this.menuTarget.classList.contains('d-none')) {
      this.menuTarget.classList.remove('d-none')
    }
  }

  waiter(event) {
    console.log('waiter')
    event.preventDefault()
    this.restaurantTarget.classList.add('d-none')
    this.menuTarget.classList.add('d-none')
    this.coverTarget.classList.add('d-none')
    if (this.waiterTarget.classList.contains('d-none')) {
      this.waiterTarget.classList.remove('d-none')
    }
  }

  cover(event) {
    console.log('cover')
    event.preventDefault()

    this.menuTarget.classList.add('d-none')
    this.waiterTarget.classList.add('d-none')
    this.restaurantTarget.classList.add('d-none')
    if (this.coverTarget.classList.contains('d-none')) {
      this.coverTarget.classList.remove('d-none')
    }
  }

}
