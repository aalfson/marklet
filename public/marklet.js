function getMarkletForm() {
	$(document).ready(function() {
		
		var form = document.createElement("div"); 
		$(form).attr('id', 'markletOverlay'); 
		$(form).attr('style', 'width: 50%; height: 50%; position: absolute; z-index: 1000; background-color: #000; margin: 0 auto 0 auto;');

		//var form = "<div id='markletOverlay' style='width: 100%; height: 100%; position: absolute; z-index: 1000; background-color: #000; ><h1>THIS IS ONE HELL OF AN OVERLAY!</h1></div>";
		$('body').prepend(form);
	});
}


function postBookmark() {

	$(document).ready(function() {
		var loc = window.location.protocol + "//" + window.location.host + window.location.pathname;
		var titleVal = document.title;

		jQuery.ajax({
		  type: 'POST',
		  url: 'http://localhost:3000/bookmark/create',
		  data: { url: loc, title: titleVal, id: markletid }, 
		  dataType: "jsonp",
		  //success: alert("Saved to marklet!"),
		});		
	});
}

function loadScript(url, callback)
{
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
				postBookmark();
			});	
		}
		else {
			console.log("The following error occured while checking for jQuery: " + err);
		}	
	}
}

init();