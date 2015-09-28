// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require_tree .

$(document).ready(function(){
    $('.datepicker').datepicker({
    	autoclose: 'true',
    	language: 'es',
    	orientation: 'top auto',
    	dateFormat: 'dd-mm-yyyy',
    	todayHighlight: true,
    	todayBtn: true
    });
  });

$('#mesestab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
});

$('.collapse').collapse({ collapsible: true, active: false });
$(function () {
  $('[data-tooltip="tooltip"]').tooltip();
})

$(document).ready(function () {
 
window.setTimeout(function() {
    $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
        $(this).remove(); 
    });
}, 5000);
 
});

$(document).ready(function() {


var elementAlreadyActive = false;
$('.nav-tabs li').each(function(index, li) {
    var element = $(li);
     if (element.attr("class") == "active"){
          elementAlreadyActive = true;
     }

});
if (!elementAlreadyActive){
    $('.nav-tabs li:first').addClass('active');
    $('.tab-content div:first').addClass('active');
} });




