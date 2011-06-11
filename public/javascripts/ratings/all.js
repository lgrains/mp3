$(function() {
		$( "#slider" ).slider();
		$( "#rating_value" ).val( "$" + $( "#slider" ).slider( "value" ) );
	});
