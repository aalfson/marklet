function getMarkletForm() {
	$(document).ready(function() {
		
		var form = document.createElement("form"); 
		$(form).attr('id', 'markletOverlay'); 
		$(form).attr('style', 'width: 500px; height: 200px; position: fixed; z-index: 10000; top: 100; left: 300; background-color: #fff; border-style: solid; border-width: 2px; border-radius: 4px; margin: 0 auto 0 auto; padding: 10px');
		
		var formTitle = document.createElement("h3"); 
		$(formTitle).text("Marklet");
		$(form).append(formTitle);
		
		var pageTitleFieldLabel = document.createElement("label"); 
		$(pageTitleFieldLabel).attr("for", "markletPagetTitle");
		$(pageTitleFieldLabel).text("Page Title:"); 

		var pageTitleField = document.createElement("input"); 
		$(pageTitleField).attr("id", "markletPageTitle"); 
		$(pageTitleField).attr("type", "text");
		
		var pageCategoryLabel = document.createElement("label"); 
		$(pageCategoryLabel).attr("for", "markletCategory");
		$(pageCategoryLabel).text("Category:"); 

		var pageCategoryField = document.createElement("input"); 
		$(pageCategoryField).attr("id", "markletCategory"); 
		$(pageCategoryField).attr("type", "select");

		var cancel = document.createElement("input"); 
		$(cancel).attr("id", "markletCancel"); 
		$(cancel).attr("type", "button");
		$(cancel).attr("value", "cancel");
		
		var submit = document.createElement("input"); 
		$(submit).attr("name", "commit"); 
		$(submit).attr("type", "submit");
		$(submit).attr("value", "Submit"); 
		
		$(form).append(pageTitleFieldLabel); 
		$(form).append(pageTitleField);
		$(form).append(pageCategoryLabel); 
		$(form).append(pageCategoryField);
		$(form).append(document.createElement("br"));
		$(form).append(cancel);
		$(form).append(submit);
		
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