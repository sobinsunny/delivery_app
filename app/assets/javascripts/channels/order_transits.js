App.messages = App.cable.subscriptions.create('OrdersChannel', {
  received: function(data) {
    return $('#order_path').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    console.log(data)
    return "<li> <b>" + data.current_location + ": </b>" + data.order_status + ": " + data.agent_name + ":" + data.agent_phone_number +"</li>"
  }
})
