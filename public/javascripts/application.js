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
});

// Always send the authenticity_token with ajax
//$(document).ajaxSend(function(event, request, settings) {
//    if ( settings.type != 'GET' ) {
//        settings.data = (settings.data ? settings.data + "&" : "")
//            + "authenticity_token=" + encodeURIComponent( AUTH_TOKEN );
//    }
//});


$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
});
