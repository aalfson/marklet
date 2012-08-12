
function postBookmark(id) {
	
	var loc = window.location.protocol + "//" + window.location.host + window.location.pathname;
	var titleVal = document.title;
	var keyVal = id;
	
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
                        callback();
                        // Handle memory leak in IE
                        script.onload = script.onreadystatechange = null;
                        head.removeChild( script );
                }
        };

        head.appendChild(script);
}

function init(id) {

	try {
		if (jQuery) {
			postBookmark(id);
		}
	}
	catch(err) {
		if (typeof jQuery != 'function' || typeof $ != 'function') {
			loadScript("http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js", function() {
				postBookmark(id);
			});
		}
		else {
			console.log("The following error occured while checking for jQuery: " + err);
		}	
	}
}

init();