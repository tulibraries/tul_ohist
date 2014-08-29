$(document).ready(function(){
	$(".clickthroughConfirm").click(function(){
		var clickThroughText = $(".modal-dialog .modal-body").text();
		$.cookie('click_through', $(".modal-dialog .modal-body").text());
		addAcceptedItem(clickThroughText);
	});
});


//// 
//  Checks on the page of the object whether its associated 
//  clickthrough terms were accepted and if not, hides the 
//  content on the page and prompts the user with the agreement
// 
//  Returns displayable content of accepted terms detected
// 
//  @params [String] clickThroughTerms
//  @params [String] confirmationButton
//  @params [String] cancellationButton
function checkForConfirmation(clickThroughTerms, confirmationButton, cancellationButton){ 
	$transcriptDiv = $('#transcript-pdf');
	if ($transcriptDiv.length){
		//To remove a cookie:
		//$.removeCookie('click_through', { path: '/' });
		var $cookieVal = $.cookie('click_through');
		acceptedTerms = $.cookie('acceptedTerms');
		if(!acceptedTerms || (acceptedTerms.indexOf(clickThroughTerms) == -1)){
			hideUnacceptedContent();
			$.confirm({
			text: clickThroughTerms,
			confirm: function(button) {
			$.cookie('click_through', clickThroughTerms);
				displayAcceptedContent();
				addAcceptedItem(clickThroughTerms);
			},
			cancel: function(button) {
				hideUnacceptedContent();      
			},
			confirmButton: confirmationButton,
			cancelButton: cancellationButton,
			});    
		} else {
			displayAcceptedContent();
		}
	}
}

//// 
//  Removes obstructing overlay and reveals page content
// 
function displayAcceptedContent(){
	$(overlay).remove();
	$('#main-container').show();
}

//// 
//  Adds obstructing overlay and hides page content
// 
function hideUnacceptedContent(){
	var overlay = jQuery('<div id="overlay"> </div>');
	if($("#overlay").length == 0){
		overlay.appendTo(document.body);
	}
	$('#main-container').hide();
}

//// 
//  Adds a set of clickthrough terms to the array 
//  of accepted terms for the session cookie
// 
function addAcceptedItem(newItem){
	var itemsArray = new Array();	
	var acceptedTerms = $.cookie('acceptedTerms');
	if(!acceptedTerms){
		$.cookie('acceptedTerms', newItem);
	} else {
		itemsArray = acceptedTerms.split(',');
		if(acceptedTerms.indexOf(newItem) == -1){
			itemsArray.push(newItem);
			$.cookie('acceptedTerms', itemsArray.join(','));
		}
	}
}

//// 
//  Display confirm box for search results view
// 
function searchResultsClickThroughConfirmBox(clickThroughTerms, confirmationButton, cancellationButton){
	$(".clickthroughConfirm").confirm({
		text: clickThroughTerms,
		confirmButton: confirmationButton,
		cancelButton: cancellationButton,
	});
}