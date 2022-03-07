import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {

  static values = { restaurantId: Number }
  static targets = ["order", "request"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "RestaurantChannel", id: this.restaurantIdValue },
      // { received: data => this.requestTarget.insertAdjacentHTML("afterbegin", data)}
      {
        received: data =>{
          console.log(data)
          if (data.includes("Order")) {
            console.log(data)
            this.orderTarget.insertAdjacentHTML("afterbegin", data)
          } else {
            this.requestTarget.insertAdjacentHTML("afterbegin", data)
          }
        }
      }
    )
    console.log(`Subscribed to the restaurant channel with the id ${this.restaurantIdValue}.`)
  }
}
