$(function() {
		$( "#slider" ).slider({
			value:3,
			min: 1,
			max: 5,
			step: 1,
			slide: function( event, ui ) {
				$( "#rating_value" ).val( "$" + ui.value );
			}
		});
		$( "#rating_value" ).val( "$" + $( "#slider" ).slider( "value" ) );
	});
