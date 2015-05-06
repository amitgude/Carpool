var directionsService = new google.maps.DirectionsService();
var directionsDisplay;
var map;
var Map = {
  initialize : function() {
    directionsDisplay = new google.maps.DirectionsRenderer();
    var chicago = new google.maps.LatLng(15.4989,73.8278);
    
    var mapOptions = {
    zoom:10,
    center: chicago
  };
  console.log("test")
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    console.log(map)
     directionsDisplay.setMap(map);
  },

  calcRoute : function(source,dest) {
    
    
    console.log(source)
    console.log(dest)
     var start = source;
     var end = dest;
     var request = {
       origin:start,
       destination:end,
       travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
     if (status == google.maps.DirectionsStatus.OK) {
       directionsDisplay.setDirections(response);
       console.log("testtt")
     }
   });
  }
}