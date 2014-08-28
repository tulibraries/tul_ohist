$(document).ready(function(){
  
  $(".clickthroughConfirm").click(function(){
    $.cookie('click_through', 'accepted');
    alert("Cookie: " + $.cookie('click_through'));
  });

});

function checkForConfirmation(clickThroughTerms, confirmationButton, cancellationButton, preamble){ 
  preamble = preamble || '';
  $transcriptDiv = $('#transcript-pdf');
  if ($transcriptDiv.length){
    //To remove a cookie:
    //$.removeCookie('click_through', { path: '/' });
    var $cookieVal = $.cookie('click_through');
    if(preamble){
      var $preamble_wrapped = "<div class=\"preamble\">" + preamble + "</div>";
      clickThroughTerms = $preamble_wrapped + clickThroughTerms;
    }

    if($cookieVal != 'accepted'){
        
        hideUnacceptedContent();

		$.confirm({
		    text: clickThroughTerms,
		    confirm: function(button) {
		      $.cookie('click_through', 'accepted');
		      displayAcceptedContent();
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

 function displayAcceptedContent(){
 	$(overlay).remove();
    $('#main-container').show();
 }

 function hideUnacceptedContent(overlay){
 	var overlay = jQuery('<div id="overlay"> </div>');
 	if($("#overlay").length == 0){
      overlay.appendTo(document.body);
    }
   $('#main-container').hide();
 }
