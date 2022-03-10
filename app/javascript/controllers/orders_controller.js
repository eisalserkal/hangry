import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = { itemId: Number }

  update(e) {
    this.clickBtn = e.currentTarget
    this.notificationCard = this.clickBtn.parentNode.parentNode
    this.animate(this.itemIdValue)

    let pending = document.getElementById("pendi")
    let pendingValue = parseInt(pending.innerText)
    console.log(pendingValue)
    pending.innerText = pendingValue - 1
    let processed = document.getElementById("procc")
    let processedValue = parseInt(processed.innerText)
    console.log(processedValue)
    processed.innerText = processedValue + 1
  }


  animate = (itemId) => {

    const fetchCall = (itemId) => this.fetchApp(itemId)
    const notificationCard = this.notificationCard

    requestAnimationFrame( function(){
      fetchCall(itemId);

        /*
        * Add transition
        * That smoothly remove the blank space
        * Leaves by the deleted notification card
        */
        window.setTimeout( function( ){
          requestAnimationFrame( function() {
            notificationCard.style.transition = 'all .4s ease';
            notificationCard.style.height = 0;
            notificationCard.style.margin = 0;
            notificationCard.style.padding = 0;
          });

          /*
          * Delete definitely the animation card
          */
          window.setTimeout( function( ){
            notificationCard.parentNode.removeChild( notificationCard );
          }, 1500 );
        }, 1500 );
    });
  }

   fetchApp = (itemId) => {
    var token = $('meta[name=csrf-token]').attr('content');

    if( this.clickBtn.classList.contains( 'archive' ) ){
      this.notificationCard.classList.add( 'archive' );
      console.log(itemId)
      fetch(`/order_items/${itemId}`, {
        method: 'PATCH',
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'X-CSRF-Token': token
      },
        body: JSON.stringify({
          status: 'On the way',
        })
      })
      .then(res => res.text()) // or res.json()
      .then(res => res )
    } else if( this.clickBtn.classList.contains( 'delete' ) ){
      this.notificationCard.classList.add( 'delete' );
    }
  }

}
