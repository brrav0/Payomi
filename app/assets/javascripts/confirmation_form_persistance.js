//app/assets/javascripts/confirmation_form_persistance.js
// We do persistance session here

function writeInSession(){


}


// PAGE READY
// ---------------------------------------------------------------------------------------
// To solve the point for user comfort
// Do not allow any user to add any file if no scan is added.
// Note that due to turbo link the usual document ready from jQuery does not handle the haschanged feature
// Go directly on the page load
$( document ).ready(function() {
	console.debug('Start debug');
});

var ready;
ready = function() {
	
	// Set the variable if exists
	if(sessionStorage.getItem("confirmation_bank_id") != null){
		$("#confirmation_bank_id").val(sessionStorage.getItem("confirmation_bank_id"));
	}	
	
	if(sessionStorage.getItem("confirmation_client_id") != null){
		$("#confirmation_client_id").val(sessionStorage.getItem("confirmation_client_id"));
	}

	
	// Add save operation operation
	$("#confirmation_bank_id").change(function(e){
    	e.preventDefault();
    	console.debug('New selected bank id: ' + $("#confirmation_bank_id").val())
    	sessionStorage.setItem("confirmation_bank_id", $("#confirmation_bank_id").val());
    });
    
    $("#confirmation_client_id").change(function(e){
    	e.preventDefault();
    	console.debug('New selected client id: ' + $("#confirmation_client_id").val())
    	sessionStorage.setItem("confirmation_client_id", $("#confirmation_client_id").val());
    });
    
    // Clear everything when the user submit
    // To make sure the data will not be retrieved again
    $( "#btn-add-confirmation" ).click(function() {
    	sessionStorage.clear();
  		console.debug( "Handler for .click() called." );
	});
    
};

$(document).ready(ready);
$(document).on('page:load', ready);




