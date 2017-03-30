//= require jquery
//= require jquery_ujs

//= require semantic-ui
//=require_self


$(document).ready(function(){

	$('.ui .message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  });

  $('.right.floated.edituser').on('click', function() {
    $('.ui.modal.edituser').modal('show');
  
  });

  $('.right.floated.editbank').on('click', function() {
    $('.ui.modal.editbank').modal('show');
  
  });

  $('.icon.remove').on('click',function(){
    $('.content.notification').slideUp()
    $('.icon.remove').fadeOut(800)
    ;
  });
  // $('.content.notification').slideUp()
// $('.content.notification').slideDown()

  $(".ui .message").fadeOut(3000);

  $('.ui.dropdown')
    .dropdown()
  ;


})