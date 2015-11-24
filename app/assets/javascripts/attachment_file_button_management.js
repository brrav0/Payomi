//app/assets/javascripts/attachment_file_button_management.js

// Update button here
function updateAttachmentFileButtonAvailability(){

	// What we do here is we check if any element of the class attached-file does exist
	// In other word do we have any attached file
	
	if ((!$.trim($("#attached_file_name").val())) ||
				 ((!$.trim($('#attached_file_attachment').val())))) {
		
		// textarea are empty OR
			// file upload is empty
		$( "#btn-save-attached-file" ).addClass('disabled');
	}
	else{
		$( "#btn-save-attached-file" ).removeClass('disabled');
	}
	
	
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

	updateAttachmentFileButtonAvailability();
	$('#attached_file_name').bind('input propertychange', function() {
		// Remove the debug here because it spam the console
		// console.debug('attached_file_name has changed');
		updateAttachmentFileButtonAvailability();
	});
	
	$("#attached_file_attachment").change(function() {
        console.debug('attached_file_attachment has changed');
        updateAttachmentFileButtonAvailability();
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);




