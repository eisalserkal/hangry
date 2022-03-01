import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bookings", "listings" ]
  connect() {
    console.log("hello from pagination_controller!")
  }

  // starters(event) {
  //   console.log('starters')
  //   event.preventDefault()

  //   this.listingsTarget.classList.add('d-none')
  //   if (this.bookingsTarget.classList.contains('d-none')) {
  //     this.bookingsTarget.classList.remove('d-none')
  //   }
  // }

  // mainCourse(event) {
  //   console.log('main course')
  //   event.preventDefault()
  //   this.bookingsTarget.classList.add('d-none')
  //   if (this.listingsTarget.classList.contains('d-none')) {
  //     this.listingsTarget.classList.remove('d-none')
  //   }
  // }

  // salads(event) {
  //   console.log('salads')
  //   event.preventDefault()
  //   this.bookingsTarget.classList.add('d-none')
  //   if (this.listingsTarget.classList.contains('d-none')) {
  //     this.listingsTarget.classList.remove('d-none')
  //   }
  // }

  // dessert(event) {
  //   console.log('dessert')
  //   event.preventDefault()
  //   this.bookingsTarget.classList.add('d-none')
  //   if (this.listingsTarget.classList.contains('d-none')) {
  //     this.listingsTarget.classList.remove('d-none')
  //   }
  // }
}
