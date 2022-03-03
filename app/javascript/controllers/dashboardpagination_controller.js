import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["restaurant", "restaurantitem", "menu", "menuitem", "waiter", "waiteritem", "cover", "coveritem", "request", "requestitem" ]
  connect() {
    console.log("hello from pagination_controller!")
  }

  restaurant(event) {
    console.log('restaurant')
    event.preventDefault()

    this.menuTarget.classList.add('d-none')
    this.waiterTarget.classList.add('d-none')
    this.coverTarget.classList.add('d-none')
    this.menuitemTarget.classList.remove('text-muted')
    this.waiteritemTarget.classList.remove('text-muted')
    this.coveritemTarget.classList.remove('text-muted')
    // this.restaurantitemTarget.classList.add('text-muted')
    // if (this.restaurantTarget.classList.contains('d-none')) {
      // this.restaurantTarget.classList.remove('d-none')
  }

  menu(event) {
    console.log('menu')
    event.preventDefault()
    this.restaurantTarget.classList.add('d-none')
    this.waiterTarget.classList.add('d-none')
    this.coverTarget.classList.add('d-none')
    this.menuitemTarget.classList.add('text-muted')
    this.waiteritemTarget.classList.remove('text-muted')
    this.coveritemTarget.classList.remove('text-muted')
    // this.restaurantitemTarget.classList.remove('text-muted')
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
    this.menuitemTarget.classList.remove('text-muted')
    this.waiteritemTarget.classList.add('text-muted')
    this.coveritemTarget.classList.remove('text-muted')
    // this.restaurantitemTarget.classList.remove('text-muted')
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
    this.menuitemTarget.classList.remove('text-muted')
    this.waiteritemTarget.classList.remove('text-muted')
    this.coveritemTarget.classList.add('text-muted')
    // this.restaurantitemTarget.classList.remove('text-muted')
    if (this.coverTarget.classList.contains('d-none')) {
      this.coverTarget.classList.remove('d-none')
    }
  }


  request(event) {
    console.log('request')
    event.preventDefault()

    this.menuTarget.classList.add('d-none')
    this.waiterTarget.classList.add('d-none')
    this.restaurantTarget.classList.add('d-none')
    this.coverTarget.classList.add('d-none')
    this.menuitemTarget.classList.remove('text-muted')
    this.waiteritemTarget.classList.remove('text-muted')
    this.coveritemTarget.classList.add('text-muted')
    this.restaurantitemTarget.classList.remove('text-muted')
    if (this.requestTarget.classList.contains('d-none')) {
      this.requestTarget.classList.remove('d-none')
    }
  }


}
