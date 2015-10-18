$(document).ready(function() {
  var alert = $('div.alert');

  var slideAlertUp = function() {
    alert.fadeOut('slow');
  }

  if (alert !== undefined) {
    setTimeout(slideAlertUp, 4000);
  };
});
