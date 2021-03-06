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
    console.log(event.target.parentElement.parentElement.querySelector('.description').innerText)
    let objIndex = -1
    this.foodsArray.forEach((obj) => {
      if (event.target.id === obj.id) {
        objIndex = this.foodsArray.indexOf(obj)
      }
    })
    if (objIndex !== -1) {
      this.foodsArray[objIndex].quantity += 1
    } else {
      this.foodsArray.push({ id: event.target.id, quantity: 1, name: event.target.parentElement.parentElement.querySelector('.name1').innerText, description: event.target.parentElement.parentElement.querySelector('.description').innerText })
    }
    this.quantityTarget.innerText = this.foodsArray.length
    price += parseFloat(event.target.parentElement.parentElement.querySelector('.price').innerText)
    this.priceTarget.innerText = price
    event.target.parentElement.querySelectorAll('.quantity').forEach((element) => {
      element.innerText = (parseInt(element.innerText)) + 1;
    })

    console.log(event.target.parentElement.parentElement.querySelector('.name1').innerText)
    this.populateModal()
  }

  decrease(event) {
    let objIndex = -1
    this.foodsArray.forEach((obj) => {
      if (event.target.id === obj.id) {
        objIndex = this.foodsArray.indexOf(obj)
      }
    })
    if (objIndex !== -1) {
      this.foodsArray[objIndex].quantity -= 1
    }
    this.foodsArray.forEach((obj) => {
      if (obj.quantity < 1) {
        this.foodsArray.splice(this.foodsArray.indexOf(obj), 1)
      }
    })
    this.quantityTarget.innerText = this.foodsArray.length
    if ( parseInt(event.target.parentElement.parentElement.querySelector('.quantity').innerText) > 0 ) {
      price -= parseFloat(event.target.parentElement.parentElement.querySelector('.price').innerText)
      event.target.parentElement.querySelectorAll('.quantity').forEach((element) => {
        element.innerText = (parseInt(element.innerText)) - 1;
        console.log(element.innerText)
      })
      }
    this.priceTarget.innerText = price

    console.log(event.target.parentElement.parentElement.querySelector('.name1').innerText)
    this.populateModal()
  }

  populateModal() {
    let modalHTML = '<div>'
    this.foodsArray.forEach((obj) => {
      modalHTML += `  <div class="card-product col-sm-12 d-flex justify-content-between no-shadow">
    <div class="card-product-infos">
      <h2>${obj.name}</h2>
      <p>${obj.description}</p>
    </div>
      <div class="mr-2" style="margin-right: 17px">
        <h2>Quantity</h2>
        <p class="fs-4 rounded-4 p-1 text-center"> ${obj.quantity}</p>
      </div>
    </div>`
    })
    modalHTML += ` </div>`
    this.modalTarget.innerHTML = modalHTML
  }
  submit() {
    if (window.location.search.includes('order_id')) {
      const urlSearchParams = new URLSearchParams(window.location.search);
      const orderId = urlSearchParams.getAll('order_id')[0]
      this.patchOrder(orderId)
    } else {
      this.postOrder()
    }
  }

  postOrder() {
    const url = '/orders'
    this.fetchOrder(url, 'POST')
  }

  patchOrder(orderId) {
    const url = `/orders/${orderId}`
    this.fetchOrder(url, 'PATCH')
  }

  fetchOrder(url, method) {
    fetch(url, {
      method: method,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify({
        orders: this.foodsArray,
        cover_id: this.coverIdValue,
      })
    }).then(response => response.json())
      .then(order => {
        console.log(order);
        window.location.href = `/orders/${order.id}`;
      })
  }

}
