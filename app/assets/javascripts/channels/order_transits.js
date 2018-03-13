App.messages = App.cable.subscriptions.create('OrdersChannel', {
  received: function(data) {
    $("#no-content-label").hide();
    return $(`#order_path-${data.order_id}`).append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    console.log(data)
    return "<tr><td>" + data.current_location + "</td><td>" + data.order_status + "</td><td>" + data.agent_name + "</td><td>" + data.agent_phone_number + "</td></tr>"
  }
});