// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {

	$(".live-link").live('click', function () {
		$.ajax({type: $(this).attr("method"), url: $(this).attr("href"), dataType: "script"});
		return false;
	});

	$(".live-form").live('submit', function () {
		$.ajax({type: $(this).attr("method"), url: $(this).attr("action"), data: $(this).serialize(), dataType: "script"});
		return false;
	});

	$(".next-slide").click(function(){
		$(this).closest('.slide').hide();
		$(this).closest('.slide').next('.slide').show();
		return false;
	});

	$(".previous-slide").click(function(){
		$(this).closest('.slide').hide();
		$(this).closest('.slide').prev('.slide').show();
		return false;
	});

	$(".slider").easySlider({
		controlsShow: false,
		continuous: true,
		auto: true,
		pause: 5000,
		speed: 500
	});

  $(function(){
    $(".tiptip").tipTip({keepAlive: true});
  });

  $(function(){
    $(".signin").click(function(e) {
      e.preventDefault();
      $("fieldset#signin_menu").toggle();
      $(".signin").toggleClass("menu-open");
    });

    $("fieldset#signin_menu").mouseup(function() {
      return false
    });

    $(document).mouseup(function(e) {
      if ($(e.target).parent("a.signin").length == 0) {
        $(".signin").removeClass("menu-open");
        $("fieldset#signin_menu").hide();
      }
    });

    $('#sign_up').colorbox({ inline: true, href: '#signupcontainer', width: "800px", height: "440px", innerHeight: "420px" });
    $('.plant').colorbox({ width: "800px", Height: "640px" });
    $('.sprowt').colorbox({ width: "50%", height: "570px", innerHeight: "540px" });

    $('.clearField').clearField();
  });
});

$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
});
