// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require toastr
//= require bootstrap-sprockets
//= require turbolinks
//= require select2
//= require_tree  .


$(document).ready(function() {

 //function to initialize select2
  function initializeSelect2(selectElementObj) {
    selectElementObj.select2({
      //width: "120%",
      //tags: true
      placeholder: "Choose an Item",
      allowClear: true
    });
  }


 //onload: call the above function 
  $("#order_place_id").each(function() {
    initializeSelect2($(this));
  });

 //Onload: When dynamic row is inserted 
$(".add-new-select").on("click", function() {
      initializeSelect2($(trGlobal));
  });

});
