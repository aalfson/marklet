function postBookmark() {

	$(document).ready(function() {
		var loc = window.location.protocol + "//" + window.location.host + window.location.pathname;
		var titleVal = document.title;

		jQuery.ajax({
		  type: 'POST',
		  url: 'http://localhost:3000/post',
		  data: { url: loc, title: titleVal, id: markletid }, 
		  dataType: "jsonp",
		  complete: alert("Saved to marklet!"),
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
			postBookmark();
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