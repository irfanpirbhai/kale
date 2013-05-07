var map;
var mapOptions;
var infoWindow;
var markers = [];
var myLatlng;

function initializeMap() {
  
  myLatlng = new google.maps.LatLng(43.6667,-79.4168);
  
  mapOptions = {
    center: myLatlng, 
    zoom: 15,
    zoomControl: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

  infoWindow = new google.maps.InfoWindow();

  google.maps.event.addListenerOnce(map, 'tilesloaded', addMarkers);
  
}

function addMarkers() {  

  function createMarker(map, position, name, address, phone, url, distance){
    
    var marker = new google.maps.Marker({
      position: vendorLatLng,
      animation: google.maps.Animation.DROP,
      map: map,
      title: name
    });

    google.maps.event.addListener(marker, 'click', function() {
      var contentString = "<div class='infoWindow-content'>"+
                          "<b>"+name+"</b>"+"  ("+distance+" km away)"+"<br>"+
                          address+"<br>"+
                          phone+"<br>"+
                          "<a href=\""+url+"\">"+url+"</a>"+"<br>"+
                          "</div>";
      infoWindow.setContent(contentString);
      infoWindow.open(map, marker);
    });
  }

  for (var i = 0; i < vendorSearchResults.length; i++){
    var lat = vendorSearchResults[i].latitude;
    var lng = vendorSearchResults[i].longitude;
    var name = vendorSearchResults[i].name;
    var address = vendorSearchResults[i].address;
    var phone = vendorSearchResults[i].phone;
    var url = vendorSearchResults[i].url;
    var distance = vendorSearchResults[i].distance;
    console.log(distance);

    var vendorLatLng = new google.maps.LatLng(lat,lng);

    createMarker(map, vendorLatLng, name, address, phone, url, distance);
  }
}