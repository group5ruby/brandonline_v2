//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery-readyselector
//= require jquery.turbolinks
//= require semantic-ui
//= require_self
//= require_tree .


var ready = function() {
    $('.ui .message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
     });



  $('.ui.rating')
  .rating('setting', 'onRate', function(value) {
      document.getElementById("rating value").value = value;
  });

  $('.ui.rating.disable')
    .rating('disable')
  ;

  $('.right.floated.edituser').on('click', function() {
    $('.ui.modal.edituser').modal('show');
  
  });

  $('.right.floated.editinfo').on('click', function() {
    $('.ui.modal.editinfo').modal('show');
  
  });

  $('.floated.editdescription').on('click', function() {
    $('.ui.modal.editdescription').modal('show');
  
  });

  $('.right.floated.editbank').on('click', function() {
    $('.ui.modal.editbank').modal('show');
  
  });

  $('.ui.inverted.blue.button.sendfeedback').on('click', function(){
    $('.ui.modal.sendfeedback').modal('show');
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
    .dropdown();
  
  $("input[name='user[filepicker_url]']").change(function() { 
    $("#submitImage").click();

  });
  $('.special.cards .image').dimmer({
    on: 'hover'
  });

  $('.tabular.menu .item').tab();
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);