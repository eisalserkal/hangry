import { Controller } from "@hotwired/stimulus"

let price = 0
export default class extends Controller {
  foodsArray = []
  static targets = ["price", "quantity", "modal"]
  static values = { coverId: Number }

  connect() {
    console.log("connected to order controller")
    console.log(this.coverIdValue)
    console.log(this.foodsArray)
  }

  increase(event) {

    let objIndex = -1
    this.foodsArray.forEach((obj) => {
      if (event.target.id === obj.id) {
        objIndex = this.foodsArray.indexOf(obj)
      }
    })
    if (objIndex !== -1) {
      this.foodsArray[objIndex].quantity += 1
    } else {
      this.foodsArray.push({ id: event.target.id, quantity: 1, name: event.target.parentElement.querySelector('.name').innerText, description: event.target.parentElement.querySelector('.description').innerText })
    }
    this.quantityTarget.innerText = this.foodsArray.length
    price += parseFloat(event.target.parentElement.querySelector('.price').innerText)
    this.priceTarget.innerText = price

    console.log(event.target.parentElement.querySelector('.name').innerText)
    let modalHTML = '<div class="container" >'
    this.foodsArray.forEach((obj) => {
      modalHTML += `  <div class="card-product col-sm-12 m-2 d-flex justify-content-between">
    <div class="card-product-infos">
      <h2>${obj.name}</h2>
      <p>${obj.description}</p>
    </div>
      <div class="mr-2">
        <h2>Quantity</h2>
        <p class="fs-4 border border-3 rounded-4 p-1"> ${obj.quantity}</p>
      </div>
    </div>`
    })
    modalHTML += ` </div>`
    this.modalTarget.innerHTML = modalHTML
  }

  postOrder() {
    const url = '/orders'
    fetch(url, {
      method: 'POST',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({
        orders: this.foodsArray,
        cover_id: this.coverIdValue
      })
    }).then(response => response.json())
      .then(order => {
        console.log(order);
        window.location.href = `/orders/${order.id}`;
      })
  }
}
