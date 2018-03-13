function copyAddressToDelivery(event) {
  var deliveryaddress = event.textContent.trim();
  $('#delivery-text-area').val(deliveryaddress);
}