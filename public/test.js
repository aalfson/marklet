
function postBookmark() {
	
	var loc = window.location.protocol + "//" + window.location.host + window.location.pathname;
	var titleVal = document.title;
	var keyVal = 'arad';
	
	jQuery.ajax({
	  type: 'POST',
	  url: 'http://localhost:3000/post',
	  data: { url: loc, title: titleVal, key: keyVal }
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

                        // Continue your code
                        callback();

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
			loadScript("http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js", function() {
				postBookmark();
			});
		}
		else {
			console.log("The following error occured while checking for jQuery: " + err);
		}	
	}
}

init();