var Login = {
  sendLoginInfo: function(data, form_id) {
    $.post("/users/sign_in.json", data, function(resp) {
      if(resp.success) {
        window.location = resp.path;
      } else {
        $(form_id + ' .error').html(resp.errors + ' ');
      }
    });
  }
};

$(function() {
  $('.email-login').click(function(){
    $(".registration-form").fadeOut();
    $('.email-login-form').fadeIn();
    return false;
  })
  $('.email-login-form form').submit(function() {
    var email = $(this).find("#user_email").val().trim();
    var pw = $(this).find("#user_password").val().trim();
    var $error = $(this).find('.error');
    if (email.length == 0) {
      $error.html("Please input email.");
    } else if (pw.length == 0) {
      $error.html("Please input password.");
    } else {
      Login.sendLoginInfo($(this).serialize(), '.email-login-form');
    }
    return false;
  });
})