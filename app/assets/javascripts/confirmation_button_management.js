//app/assets/javascripts/confirmation_button_management.js

// Update button here
function updateButtonAvailability(){
	// What we do here is we check if any element of the class attached-file does exist
	// In other word do we have any attached file
	if ( $( ".auditor-attached-file" ).length ) {
		$( "#btn-add-confirmation" ).removeClass('disabled');
	}
	else{
		$( "#btn-add-confirmation" ).addClass('disabled');
	}
	// WARNING CODE DUPLICATION
	// What we do here is we check if any element of the class attached-file does exist
	// In other word do we have any attached file
	if ( $( ".bank-attached-file" ).length ) {
		$( "#btn-answer-confirmation" ).removeClass('disabled');
	}
	else{
		$( "#btn-answer-confirmation" ).addClass('disabled');
	}
}


// PAGE READY
// ---------------------------------------------------------------------------------------
// To solve the point for user comfort
// Do not allow any user to add any file if no scan is added.
// Note that due to turbo link the usual document ready from jQuery does not handle the haschanged feature
// Go directly on the page load
$( document ).ready(function() {
	console.debug('Start Log');
});

var ready;
ready = function() {

	updateButtonAvailability();
};

$(document).ready(ready);
$(document).on('page:load', ready);




