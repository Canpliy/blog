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

  // 提示框关闭
  $('.alert-content').click(function(event) {
    $(event.target).parent('div').remove();
    event.preventDefault();
  });

  //个人中心二级菜单连接
  $personInfoContainer = $('.person-info-container');
  $('.person-nav > a').click(function(event) {
    $(this).addClass('selected').siblings().removeClass('selected');
    $personInfoContainer.children('div').hide().eq($(this).index()).show();
    event.preventDefault();
  });

  $('#edit-image').submit(function(event) {
    if(window.FormData) {
      var formData = new FormData(document.getElementById('edit-image'));
      var xhr = new XMLHttpRequest();
      xhr.open('PATCH', $(this).attr('action'));
      xhr.setRequestHeader('Accept', 'application/json');
      xhr.send(formData);
      xhr.onload = function(){
        if(xhr.status >= 200 && xhr.status < 300){
          user = JSON.parse(xhr.responseText);
          $('.avatar').attr('src', user.img_url);
          $(".alert-content").prepend("<div class='alert alert-success'><a href='#' class='close'>X</a> 头像更新成功！ </div>");
        }else{
          console.log("error");
          console.log(xhr.responseText);
        }
      }
    }
    event.preventDefault();
  });

  $('#edit-image .image-update').change(function(event) {
    $(this).parent('form').submit();
  });


  $('#mytest').change(function(event) {
    alert($(this).val());
  });
});