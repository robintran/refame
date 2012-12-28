$(document).ready(function () {
  // $(".popups").click(function(){
  //     $('#zoomContainer01').css({width:$(document).width(), height:$(document).height()}).show();
  //     $(".lightBox").css("left",($(document).width()/2)-200);
  //     $(".lightBox").fadeIn();
  //   });

  $('#zoomContainer01').click(function () {
    // $(".lightBox").fadeOut();
    // $('#zoomContainer01').hide();
    $(".email-login-form").fadeIn();
    $('#zoomContainer01').show();
    return false;
  });

  // $('.clrPopup').click(function () {
  //   $(".lightBox").fadeOut();
  //   $('#zoomContainer01').hide();
  //   return false;
  // });

  // $(window).resize(function() {
  //    if (!$('#zoomContainer01').is(':hidden')){
  //      $('#zoomContainer01').css({width:$(document).width(), height:$(document).height()}).show();
  //    };
  // });
});
