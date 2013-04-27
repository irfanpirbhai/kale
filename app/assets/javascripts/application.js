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
  $("li.list_result:not(.selected)").hide();
  $(this).parent().parent().find("i.hideprices, i.showprices").toggle()
  e.preventDefault();
}

var showPrices = function(e) {
  $(this).parent().parent().find("ul li.list_result").show();
  $(this).parent().parent().find("i.hideprices, i.showprices").toggle()
  e.preventDefault();
}

$("i.showprices").click(showPrices);
$("i.hideprices").click(hidePrices);


$("li.list_result").on("click", function(){
  $(this).siblings().removeClass("selected");
  $(this).addClass("selected");
  hidePrices();
});

})