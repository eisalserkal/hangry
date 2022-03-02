import { Controller } from "@hotwired/stimulus"
const foodsArray = []
let price = 0
export default class extends Controller {

  static targets = ["price", "quantity"]

  connect() {
    console.log("connected to order controller")
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
    foodsArray.push({id: event.target.id, quantity: 1})

  }
  console.log(foodsArray)
  this.quantityTarget.innerText = foodsArray.length
  price += parseFloat(event.target.parentElement.querySelector('.price').innerText)
  this.priceTarget.innerText = price
}
}
