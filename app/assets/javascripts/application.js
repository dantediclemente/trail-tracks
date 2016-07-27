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
//= require foundation
//= require gmaps/google
//= require underscore
//= require map
//= require jquery-ui
//= require jquery-ui/draggable
//= require jquery-ui/droppable
//= require jquery-ui/resizable
//= require jquery-ui/selectable
//= require jquery-ui/sortable
//= require wishlist
//= require_tree .
//= require highcharts/highcharts
//= require highcharts/highcharts-more
//= require highcharts/highstock
//= require foundation

$(function(){ $(document).foundation(); });

$('document').ready(function() {
  setTimeout(function() {
    $('#flash').slideUp();
  }, 1500);
});
