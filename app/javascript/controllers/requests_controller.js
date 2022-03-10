import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this.funcName()
  }


    funcName = () => (function(){
      console.log('inside function')
  /*
  * Get all the buttons actions
  */
  let optionBtns = document.querySelectorAll( '.js-option' );

  let pending = document.getElementById("pend")
  let processed = document.getElementById("proc")

  var token = $('meta[name=csrf-token]').attr('content');

  for(var i = 0; i < optionBtns.length; i++ ) {

    /*
    * When click to a button
    */
    optionBtns[i].addEventListener( 'click', function ( e ){

      var notificationCard = this.parentNode.parentNode;
      var clickBtn = this;
      /*
      * Execute the delete or Archive animation
      */
      requestAnimationFrame( function(){

        archiveOrDelete( clickBtn, notificationCard );

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
    })
  }

  /*
  * Function that adds
  * delete or archive class
  * To a notification card
  */
  var archiveOrDelete = function( clickBtn, notificationCard ){
    if( clickBtn.classList.contains( 'archive' ) ){
      notificationCard.classList.add( 'archive' );
      pending.innerText = "29"
      processed.innerText = "16"
    } else if( clickBtn.classList.contains( 'delete' ) ){
      notificationCard.classList.add( 'delete' );
      let requestId = document.getElementById( 'demo' ).textContent;
      fetch(`/requests/${requestId}`, {
      method: 'DELETE',
      headers: {
        'Content-type': 'application/json',
        'X-CSRF-Token': token
      },
      })
      .then(res => res.text()) // or res.json()
      .then(res => console.log(res))
    }
  }

})()

}


// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {

//   static values = { requestId: Number }

//   update(e) {
//     this.clickBtn = e.currentTarget
//     this.notificationCard = this.clickBtn.parentNode.parentNode
//     this.animate(this.requestIdValue)
//   }


//   animate = (requestId) => {

//     const fetchCall = (requestId) => this.fetchApp(requestId)
//     const notificationCard = this.notificationCard

//     requestAnimationFrame( function(){
//       fetchCall(requestId);

//         /*
//         * Add transition
//         * That smoothly remove the blank space
//         * Leaves by the deleted notification card
//         */
//         window.setTimeout( function( ){
//           requestAnimationFrame( function() {
//             notificationCard.style.transition = 'all .4s ease';
//             notificationCard.style.height = 0;
//             notificationCard.style.margin = 0;
//             notificationCard.style.padding = 0;
//           });

//           /*
//           * Delete definitely the animation card
//           */
//           window.setTimeout( function( ){
//             notificationCard.parentNode.removeChild( notificationCard );
//           }, 1500 );
//         }, 1500 );
//     });
//   }

//    fetchApp = (requestId) => {
//     var token = $('meta[name=csrf-token]').attr('content');
//     if( this.clickBtn.classList.contains( 'archive' ) ){
//       this.notificationCard.classList.add( 'archive' );
//     } else if( this.clickBtn.classList.contains( 'delete' ) ){
//       this.notificationCard.classList.add( 'delete' );
//       console.log(requestId)
//       fetch(`/requests/${requestId}`, {
//         method: 'DELETE',
//         headers: {
//           "Content-Type": "application/json",
//           'X-CSRF-Token': token
//       },
//       })
//       .then(res => res.text()) // or res.json()
//       .then(res => res )
//     }
//   }

// }
