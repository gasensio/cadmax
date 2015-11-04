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
//= require jquery.turbolinks
//= require turbolinks
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require_tree .
//= require highcharts/highstock


$(document).ready(function () {
    $('.datepicker').datepicker({
      autoclose: 'true',
      language: 'es',
      orientation: 'top auto',
      dateFormat: 'dd-mm-yyyy',
      todayHighlight: true,
      todayBtn: true
    });
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
    if(location.hash) {
        $('a[href=' + location.hash + ']').tab('show');
    }
    $(document.body).on("click", "a[data-toggle]", function(event) {
        location.hash = this.getAttribute("href");
    });
});
$(window).on('popstate', function() {
    var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");
    $('a[href=' + anchor + ']').tab('show');
});

$(document).ready(function(){
$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  location.reload();
});
});






