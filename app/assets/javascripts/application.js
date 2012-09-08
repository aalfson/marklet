// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

function initUnsubscribeActionButton() {
	
	$("#unsubscribe_button").bind('click', function(e) {
		
		e.preventDefault(); 
		
		var category = $(this).data('category'); 

		$.ajax({
			type: 'POST', 
			url: '/c/unsubscribe',
			data: { category: category },
			success: function() {
				$(this).unbind();
				$(this).attr('id', "#subscribe_button"); 
				$("#subscribe_button > i").attr('class', 'icon-minus icon-white'); 
				initSubscribeButton();
			}
		}); 		
	});
}


function initSubscribeActionButton() {
	
	$("#subscribe_button").bind('click', function(e) {
		
		e.preventDefault(); 
						
		var category = $(this).data('category'); 

		$.ajax({
			type: 'POST', 
			url: '/c/subscribe',
			data: { category: category },
			dataType: "jsonp",
			success: function() {
				$(this).unbind();
				$(this).attr('id', "#unsubscribe_button"); 
				$("#unsubscribe_button > i").attr('class', 'icon-plus icon-white'); 
				initUnsubscribeButton();
			}
		}); 
	}); 
}


function initBookmarkActionButtons() {
	
	$(".bookmark_row").bind('mouseover', function() {
		$(this).find('.bookmark_action').show();
	}); 
	
	$(".bookmark_row").bind('mouseout', function() {
		$(this).find('.bookmark_action').hide(); 
	});

	$(".icon-remove").bind('click', function(e) {
		
		e.preventDefault(); 
		
		var id = $(this).data('bookmark'); 
		var row = $(this).parents('tr')[0];
		
		$.ajax({
		  type: 'DELETE',
		  url: '/bookmark/delete',
		  dataType: 'json',
		  data: { id: id }, 
		  success: function(data) {
			$(row).hide();
			$(row).remove(); 
		},
		  error: function(data) {
			console.log("Error:");
			console.log(data);
		}
		});
	});
}

jQuery(function() {

	//provides the functionality for the edit & delete buttons on each bookmark row. 
	initBookmarkActionButtons(); 
	
	//provides functionality to the subscribe & unsubscribe buttons in each category
	initSubscribeActionButton(); 
	initUnsubscribeActionButton(); 
});