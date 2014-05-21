$(document).on('page:change', function(){

  // 表单用户体验优化
  var inputValue = "";
  $('.comment-form input, .comment-form textarea').focus(function(event) {
    inputValue = $(this).attr('value') || $(this).text();
    if($(this).val() == inputValue){
      $(this).val("");
    }
  }).blur(function(event) {
    if($(this).val() == ""){
      $(this).val(inputValue);
    }
  });

});