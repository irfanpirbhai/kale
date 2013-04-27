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

$(document).ready(function(){

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
  e.preventDefault();
  $(this).parent().parent().find("i.hideprices, i.showprices").toggle();
  
  if ($(this).siblings().filter(":hidden").length > 0) {
    // show all inventory_records
    $(this).parent().parent().find("ul li.list_result").show();     
  }
    else {
    // hide unselected inventory_records
    $(this).siblings().removeClass("selected");
    $(this).addClass("selected");
    $(this).parent().find("li.list_result:not(.selected)").hide();
  };

});

})