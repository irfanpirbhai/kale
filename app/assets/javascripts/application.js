// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require geolocationmarker.js
//= require markerwithlabel.js

$(document).ready(function(){

  $("li.list_result:first-child").prepend("<span class='badge badge-success'>$</span>");
  
  $("i.hideprices").hide();
  $("li.list_result:not(.selected)").hide();

  var hidePrices = function(e) {
    e.preventDefault();
    $(this).parent().parent().find("li.list_result:not(.selected)").hide();
    $(this).parent().parent().find("i.hideprices, i.showprices").toggle();
  }

  var showPrices = function(e) {
    e.preventDefault();
    $(this).parent().parent().find("ul li.list_result").show();
    $(this).parent().parent().find("i.hideprices, i.showprices").toggle();
  }

  $("i.showprices").click(showPrices);
  $("i.hideprices").click(hidePrices);


  $("li.list_result").click(function(e){
    $(this).parent().parent().find("i.hideprices, i.showprices").toggle();
    
    if ($(this).siblings().filter(":hidden").length > 0) {
      // show all hidden inventory_records
      $(this).parent().parent().find("ul li.list_result").show();     
    }
    else {
    // hide unselected inventory_records
    $(this).siblings().removeClass("selected label");
    $(this).addClass("selected label");
    $(this).parent().find("li.list_result:not(.selected)").hide();
    }

  });

  // Error messages
  window.setTimeout(function() {
      $(".alert").fadeTo(500, 0).slideUp(500, function(){
          $(this).remove(); 
      });
  }, 1000);

  // Map load
  var location = $(".vendor-search-form #location").val();
  var distance = $(".vendor-search-form #distance").val();

  $(".vendor-search-form #location").change(function(){
    location = $(this).val();
  });

  $(".vendor-search-form #distance").change(function(){
    distance = $(this).val();
  });  

  var loadSearchResults = function(){
    $.ajax({
      url: "http://localhost:3000/vendors", 
      type: "GET", 
      dataType: "json", 
      data: { location: location, distance: distance }, 
      success: function(data) {
        console.log("Map request was made.");
        vendorSearchResults = data;
        // Initialize Google Maps
        if ($("#map-canvas").length > 0) {
          initializeMap();
        }
      }
    })
  }

  $(".vendor-search-form-submit").on("click", function(e){
    e.preventDefault();
    loadSearchResults();
  })

  // Geolocation

  var geolocate = function(e) {
    e.preventDefault();
    console.log("click");
    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(writePosition);
    }
    else{console.log("Geolocation is not supported by this browser.");}
  };

  var writePosition = function(position){
    inputLat = position.coords.latitude;
    inputLng = position.coords.longitude;
    location = inputLat + ", " + inputLng;
    loadSearchResults();
    $(".vendor-search-form #location").val(location);
  };
    
  $("i.geolocate").click(geolocate);

})