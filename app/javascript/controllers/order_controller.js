import { Controller } from "@hotwired/stimulus"
const foodsArray = []
export default class extends Controller {

  connect() {
    console.log("connected to order controller")
  }

  increase(event) {
    let objIndex = -1
    foodsArray.forEach((obj) => {
      console.log(event.target.id, obj.id)
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
}
}
