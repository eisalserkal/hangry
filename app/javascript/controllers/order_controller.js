import { Controller } from "@hotwired/stimulus"
const foodsArray = []
let price = 0
export default class extends Controller {

  static targets = ["price", "quantity", "modal"]

  connect() {
    console.log("connected to order controller")
    console.log(this.modalTarget)
  }

  increase(event) {

    let objIndex = -1
    foodsArray.forEach((obj) => {
      if (event.target.id === obj.id) {
        objIndex = foodsArray.indexOf(obj)
      }
    })
    console.log (objIndex)
    if(objIndex !== -1) {
      foodsArray[objIndex].quantity += 1
    } else {
    foodsArray.push({id: event.target.id, quantity: 1, name: event.target.parentElement.querySelector('.name').innerText, description:event.target.parentElement.querySelector('.description').innerText })

  }
  console.log(foodsArray)
  this.quantityTarget.innerText = foodsArray.length
  price += parseFloat(event.target.parentElement.querySelector('.price').innerText)
  this.priceTarget.innerText = price

  console.log(event.target.parentElement.querySelector('.name').innerText)
  let modalHTML = '<div class="container" >'
  foodsArray.forEach((obj)=>{
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

}
