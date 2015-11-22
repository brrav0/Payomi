// To solve the point for user comfort
// Do not allow any user to add any file if no scan is added.
$( document ).ready(function() {
	console.log('Start Log');
	
	// What we do here is we check if any element of the class attached-file does exist
	// In other word do we have any attached file
	if ( $( ".auditor-attached-file" ).length ) {
		$( "#btn-add-confirmation" ).removeClass('disabled');
	}
	else{
		$( "#btn-add-confirmation" ).addClass('disabled');
	}
});