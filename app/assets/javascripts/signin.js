$(document).on('page:change', function(){
  $('#signin-container input').focus(function(event){
    $(this).parent().addClass('focus');
  }).blur(function(event) {
    $(this).parent().removeClass('focus');
  });
});