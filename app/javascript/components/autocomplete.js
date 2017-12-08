function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var snowbotLocation = document.getElementById("start_city");

    if (snowbotLocation) {
      var autocomplete = new google.maps.places.Autocomplete(snowbotLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(snowbotLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
