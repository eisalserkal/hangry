import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {

  static values = { restaurantId: Number }
  static targets = ["order", "request", "orderitem", "requestitem", "requestnotif", "ordernotif"]

  connect() {


    this.channel = consumer.subscriptions.create(
      { channel: "RestaurantChannel", id: this.restaurantIdValue },
      // { received: data => this.requestTarget.insertAdjacentHTML("afterbegin", data)}
      {
        received: data =>{
          console.log(data)
          if (data.includes("Order")) {
            this.orderTarget.insertAdjacentHTML("afterbegin", data)
            if (!this.orderitemTarget.classList.contains('text-muted')) {
              this.ordernotifTarget.classList.remove('d-none')
            }
          } else {
            this.requestTarget.insertAdjacentHTML("afterbegin", data)
            if (!this.requestitemTarget.classList.contains('text-muted')) {
              this.requestnotifTarget.classList.remove('d-none')
            }
          }
        }
      }
    )
    console.log(`Subscribed to the restaurant channel with the id ${this.restaurantIdValue}.`)
  }


}
