import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {

  static values = { restaurantId: Number }
  static targets = ["request"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "RestaurantChannel", id: this.restaurantIdValue },
      { received: data => this.requestTarget.insertAdjacentHTML("afterbegin", data)}
    )
    console.log(`Subscribed to the restaurant channel with the id ${this.restaurantIdValue}.`)
  }
}
