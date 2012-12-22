var Registration = {
  sendRegistrationInfo: function(data, form_id) {
    $.ajax({
      type: 'POST',
      url: "/users",
      dataType: 'json',
      data: data,
      success: function(resp) {
        if (resp.success) {
          window.location = resp.path;
        } else {
          $(form_id).find('.error.error-first-name').html(resp.msg.first_name ? resp.msg.first_name : "");
          $(form_id).find('.error.error-last-name').html(resp.msg.last_name ? resp.msg.last_name : "");
          $(form_id).find('.error.error-email').html(resp.msg.email ? resp.msg.email : "");
          $(form_id).find('.error.error-password').html(resp.msg.password ? resp.msg.password : "");
          $(form_id).find('.error.error-password-confirmation').html(resp.msg.password_confirmation ? resp.msg.password_confirmation : "");
        }
      }
    });
  }
}

$(function() {
  $('.email-registration').click(function(){
    $(".registration-form").fadeOut();
    $(".email-registration-form").css("left",($(document).width()/2)-200);
    $('.email-registration-form').fadeIn();
    return false;
  })
  $('.email-registration-form form').submit(function() {
    Registration.sendRegistrationInfo($(this).serialize(), '.email-registration-form');
    return false;
  });
})