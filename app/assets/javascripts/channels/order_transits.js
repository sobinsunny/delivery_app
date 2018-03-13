App.messages = App.cable.subscriptions.create('OrdersChannel', {
  received: function(data) {
    // handling first update
    $("#no-content-label").hide();
    return $('#order_path-' + data.order_id).append(this.renderMessage(data));
  },
  renderMessage: function(data) {
    return "<tr><td>" + data.current_location + "</td><td>" + data.order_status + "</td><td>" + data.agent_name + "</td><td>" + data.agent_phone_number + "</td></tr>"
  }
});