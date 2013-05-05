// var map;

// function initializeMap() {
//   var mapOptions = {
//     center: new google.maps.LatLng(43.6667, -79.4167), 
//     zoom: 15,
//     zoomControl: true,
//     zoomControlOptions: {
//       style: google.maps.ZoomControlStyle.SMALL
//     },
//     mapTypeId: google.maps.MapTypeId.ROADMAP
//   };
  
//   var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
//   // map.addOverlay(new GMarker(43.6667, -79.418406));

// }


// // setup 10 random points 
// var bounds = map.getBounds(); 
// var southWest = bounds.getSouthWest(); 
// var northEast = bounds.getNorthEast(); 
// var lngSpan = northEast.lng() – southWest.lng(); 
// var latSpan = northEast.lat() – southWest.lat(); 
// var markers = []; 
// for (var i = 0; i<10; i++) { 
//   var point = new GLatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random()); 
//   marker = new GMarker(point); 
//   map.addOverlay(marker); 
//   markers[i] = marker; 
// }