// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//float label for searching rides
$(function() {
    $('.float_label input').on('blur', function() {
        var text_val = $(this).val();
  if(text_val == '') {
    
    $(this).removeClass('has-value');
  }else {
    $(this).addClass('has-value');
  }
   });
});


$(document).ready(function() {
    setTimeout(function() {
        $("#notice_wrapper").fadeOut("slow", function() {
            $(this).remove();
        })
    }, 3500 );
});

function initialize() {
var mapOptions = {
 center: new google.maps.LatLng(-33.8688, 151.2195),
 zoom: 13
};
var map = new google.maps.Map(document.getElementById('map-canvas2'),
 mapOptions);

var input = /** @type {HTMLInputElement} */(
   document.getElementById('source'));


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

 // If the place has a geometry, then present it on a map.
 

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

window.addEventListener("load",function() {
$nav = $('nav');
$nav.addClass('scrolled');
 });

function getLocation(e) {
    e.preventDefault();
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }

    
    
}

function showPosition(position) {
    //alert(position.coords.latitude);
    //alert(position.coords.longitude);
    
    document.getElementById('location_latitude').value = position.coords.latitude;
    document.getElementById('location_longitude').value = position.coords.longitude;

    document.getElementById('new_location').submit();
    console.log(position.coords.latitude)
}
