import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {

  static values = { orderId: Number }

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "OrderChannel", id: this.orderIdValue },
      { received: data =>
        document.querySelectorAll('.accepted').forEach((element) => {
          if (parseInt(element.id) === parseInt(data)) {
            console.log(element.id)
          }
        })
      }
    )
  }
}
