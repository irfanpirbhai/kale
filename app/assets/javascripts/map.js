var map;
var mapOptions;
var infoWindow;
var markers = [];
var inputLat;
var inputLng;
var myLatlng;
var bounds;

function initializeMap() {

  inputLat = vendorSearchResults[0].inputted_location_lat;  
  inputLng = vendorSearchResults[0].inputted_location_lng;

  myLatlng = new google.maps.LatLng(inputLat, inputLng);
  bounds = new google.maps.LatLngBounds();
  bounds.extend(myLatlng);

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
  var GeoMarker = new GeolocationMarker(map);

  function createMarker(map, position, name, address, phone, url, distance){
      
    var marker = new MarkerWithLabel({
      position: vendorLatLng,
      animation: google.maps.Animation.DROP,
      map: map,
      title: name,
      labelContent: distance+" km",
      labelAnchor: new google.maps.Point(22, 0),
      labelClass: "labels", // the CSS class for the label
    });

    var marker2 = new google.maps.Marker({
      position: myLatlng,
      map: map,
      icon: "/assets/arrow.png",
      shadow: "/assets/arrowshadow.png"
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
    var url = vendorSearchResults[i].url || "";
    var distance = vendorSearchResults[i].distance;

    var vendorLatLng = new google.maps.LatLng(lat,lng);
    
    bounds.extend(vendorLatLng);
    
    createMarker(map, vendorLatLng, name, address, phone, url, distance);
  }
    map.fitBounds(bounds);
}