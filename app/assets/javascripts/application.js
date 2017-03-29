//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//=require_self


$(document).ready(function(){

	$('.ui .message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });
  

  $('.ui.dropdown')
    .dropdown()
  ;
})