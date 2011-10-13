$(function() {
	$('.accept_current_price').click(function(e) {
		e.preventDefault();
		var accept_current_price = $("[name='bid[accept_current_price]']");
		if (accept_current_price.val() == '1') {
			accept_current_price.val(0);
		} else {
			accept_current_price.val(1);
		}
	});

	$('.expires li label').click(function() {
		$('.expires li label').removeClass('active');
		$(this).addClass('active');
	});

	$("#bid_submit").click(function(e) {
		e.preventDefault();
		$.post("#{bids_path}", $("#new_bid").serialize(), function(json) {
			console.log(json);
			if (json.success == 'false') {
				$.fn.colorbox({
					html: json.html,
					open: true,
					iframe: false,
					width: "50%",
					height: "650px",
					innerHeight: "540px"
				});
			} else {
				$('#cboxClose').click();
				return false;
			}
		},
		"json");
	});
});
