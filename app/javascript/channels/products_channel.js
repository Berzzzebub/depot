import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to products channel.")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Data', data)
    let storeElement = document.querySelector("main.store")
    if(storeElement)
      storeElement.innerHTML = data.html
  }
});
