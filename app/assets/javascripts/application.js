//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require semantic-ui
//=require_self
$('.ui.dropdown')
  .dropdown()
;

;
$('.ui .message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;

$(".close .icon").click(function(){
  $(this).parent().hide();
});

$(document).ready(function(){
	$('.ui .message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
;
})