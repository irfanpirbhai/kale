var map;

function initializeMap() {
  var myLatlng = new google.maps.LatLng(43.6667,-79.4168);
  
  var mapOptions = {
    center: myLatlng, 
    zoom: 15,
    zoomControl: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  var marker = new google.maps.Marker({
      position: myLatlng,
      animation: google.maps.Animation.DROP,
      map: map,
      title: 'Karma Coop'
      });

  var contentString = "<div class='infoWindow-content'>"+
                      "<b>"+"Karma Coop"+"</b>"+"<br>"+
                      "39 Palmerston Ave, Toronto ON, M6G 2R3"+"<br>"+
                      "(416) 534-1470"+"<br>"+
                      "<a href='www.karmacoop.org'>www.karmacoop.org</a>"+"<br>"+
                      "</div>";

  var infowindow = new google.maps.InfoWindow({
      content: contentString
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });

}

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