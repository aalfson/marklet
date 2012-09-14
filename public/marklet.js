function createForm() {

	var form = document.createElement("form"); 
	$(form).attr('id', 'markletOverlay'); 
	$(form).attr('style', 'width: 500px; height: 200px; position: fixed; z-index: 10000; top: 100; left: 300; background-color: #fff; border-style: solid; border-width: 2px; border-radius: 4px; margin: 0 auto 0 auto; padding: 10px');

	return form;
}

function createFormTitle(form) {
	
	var formTitle = document.createElement("h3"); 
	$(formTitle).text("Marklet");
	$(form).append(formTitle);
}

function createTitleField(form) {
	
	var pageTitleFieldLabel = document.createElement("label"); 
	$(pageTitleFieldLabel).attr("for", "markletPagetTitle");
	$(pageTitleFieldLabel).text("Page Title:"); 

	var pageTitleField = document.createElement("input"); 
	$(pageTitleField).attr({"id": "markletPageTitle", "type": "text", "value": document.title});

	$(form).append(pageTitleFieldLabel); 
	$(form).append(pageTitleField);
}

function createCategorySelector(form) {
	
	var pageCategoryLabel = document.createElement("label"); 
	$(pageCategoryLabel).attr("for", "markletCategory");
	$(pageCategoryLabel).text("Category:"); 

	var pageCategoryField = document.createElement("select"); 
	$(pageCategoryField).attr("id", "markletCategory");
	
	$(form).append(document.createElement("br"));
	$(form).append(pageCategoryLabel); 
	$(form).append(pageCategoryField);
}

function createButtons(form) {
	
	var cancel = document.createElement("input"); 
	$(cancel).attr("id", "markletCancel"); 
	$(cancel).attr("type", "button");
	$(cancel).attr("value", "Cancel");
	
	var submit = document.createElement("input"); 
	$(submit).attr({"name": "commit", "type": "submit", "value": "Submit"}); 
	
	$(form).append(document.createElement("br"));
	$(form).append(cancel);
	$(form).append(submit);

}

function getMarkletForm() {

	var form = createForm(); 
	createFormTitle(form);
	createTitleField(form); 
	createCategorySelector(form); 
	createButtons(form)
	
	$('body').prepend(form);
}


function postBookmark() {

	$(document).ready(function() {
		var loc = window.location.protocol + "//" + window.location.host + window.location.pathname;
		var titleVal = document.title;

		jQuery.ajax({
		  type: 'POST',
		  url: 'http://localhost:3000/bookmark/create',
		  data: { url: loc, title: titleVal, id: markletid }, 
		  dataType: "jsonp"
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