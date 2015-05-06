function initialize() {
var mapOptions = {
 center: new google.maps.LatLng(-33.8688, 151.2195),
 zoom: 13
};
var map = new google.maps.Map(document.getElementById('map-canvas2'),
 mapOptions);

var input = /** @type {HTMLInputElement} */(
   document.getElementById('destination'));



var autocomplete = new google.maps.places.Autocomplete(input);


autocomplete.bindTo('bounds', map);


var infowindow = new google.maps.InfoWindow();


google.maps.event.addListener(autocomplete, 'place_changed', function() {
 infowindow.close();
 
 var place = autocomplete.getPlace();

 if (!place.geometry) {
   window.alert("Autocomplete's returned place contains no geometry");
   return;
 }

 

 var address = '';
 if (place.address_components) {
   address = [
     (place.address_components[0] && place.address_components[0].short_name || ''),
     (place.address_components[1] && place.address_components[1].short_name || ''),
     (place.address_components[2] && place.address_components[2].short_name || '')
   ].join(' ');
 }

 infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
 
});


}

google.maps.event.addDomListener(window, 'load', initialize);
