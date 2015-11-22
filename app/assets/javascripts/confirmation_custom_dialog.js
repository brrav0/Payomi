
// What we do here is we delete on the fly the unwanted row
// Plus we delete it at the end
function handleDeleteAfterConfirmation(urlToReachForDelete, parameterToWork){

	if(urlToReachForDelete.indexOf("attached_files") > -1){
		var splitResult = urlToReachForDelete.split("/");
		var rowId = splitResult[splitResult.length - 1];
		var htmlRowIdentifier = 'row_' + rowId;
		console.debug('htmlRowIdentifier: ' + htmlRowIdentifier);
		
		// We need to check now if we can delete
		if(parameterToWork.textContent == 'delete'){
			console.debug('Registered for delete');
			$.ajax({
			  url: urlToReachForDelete,
			  type: 'DELETE',
			  success: function(result) {
				$('#' + htmlRowIdentifier).remove();
				updateButtonAvailability();
				console.debug('Delete successful');
			  }
			});
		}
	};
};

// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
//Override the default confirm dialog by rails
$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}
//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){

  var message = link.data("confirm");
  var urlToReachForDelete = link.context.href;
  console.debug('urlToReachForDelete: ' + urlToReachForDelete);
  
  bootbox.confirm(message, 
  		function(result){
  			
  			var parameterToWork = link[0].attributes[3];
  			console.debug('Clicked in bootbox.confirm - link[0].attributes[3]: ' + link[0].attributes[3]);
  			
  			handleDeleteAfterConfirmation(urlToReachForDelete, parameterToWork);
  		})
}