function getMarkletForm() {
	jQuery.ajax({
		type: 'POST', 
		url: 'http://localhost:3000/bookmark/form',
		data: {user: markletid, title: document.title},
		success: function(data){	
			$('body').prepend(data);
			
			$("#markletFormCancel").bind('click', function() {
				$("#markletSubmitFormOverlay").hide(); 
				$("#markletSubmitFormOverlay").remove(); 
			}); 		
		}
	}); 
}

function postBookmark() {

	$(document).ready(function() {
		var loc = window.location.protocol + "//" + window.location.host + window.location.pathname;
		var titleVal = document.title;

		jQuery.ajax({
		  type: 'POST',
		  url: 'http://localhost:3000/bookmark/create',
		  data: { url: loc, title: titleVal, id: markletid }
		});		
	});
}

/* 	The functions below are used to load jQuery and were slightly modified by me but essentially
 	written by someone else. Unfortunately, I have no idea where I got it from, 
	but I want to give credit where it is due. Thanks! */
	
function loadScript(url, callback) {
        var head = document.getElementsByTagName("head")[0];
        var script = document.createElement("script");
        script.src = url;

        // Attach handlers for all browsers
        var done = false;
        script.onload = script.onreadystatechange = function()
        {
                if( !done && ( !this.readyState 
                                        || this.readyState == "loaded" 
                                        || this.readyState == "complete") )
                {
                        done = true;
						if (callback != null) {
							callback();
						}

                        // Handle memory leak in IE
                        script.onload = script.onreadystatechange = null;
                        head.removeChild( script );
                }
        };

        head.appendChild(script);
}

function init() {

	try {
		if (jQuery) {
			//postBookmark();
			getMarkletForm(); 
		}
	}
	catch(err) {
		if (typeof jQuery != 'function' || typeof $ != 'function') {
			loadScript("http://localhost:3000/jquery-1.7.2.min.js", function() {
				// postBookmark();
				getMarkletForm();
			});	
		}
		else {
			console.log("The following error occured while checking for jQuery: " + err);
		}	
	}
}

init();