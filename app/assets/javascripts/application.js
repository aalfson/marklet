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


$(document).ready(function() {
	
	$(".bookmark_row").bind('mouseover', function() {
		$(this).find('.bookmark_action').show();
	}); 
	
	$(".bookmark_row").bind('mouseout', function() {
		$(this).find('.bookmark_action').hide(); 
	});

	$(".icon-remove").bind('click', function() {
		
		var id = $(this).attr('bookmark'); 
		
		jQuery.ajax({
		  type: 'DELETE',
		  url: 'http://localhost:3000/bookmark/delete',
		  data: { id: id }, 
		  dataType: "jsonp",
		});
	}); 
	
	// $(".icon-pencil").bind('click', function() {
	// 	var id = $(this).attr('bookmark');
	// 	window.location.replace('http://localhost:3000/bookmark/update');
	// });
	
}); 
