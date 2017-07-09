$(document).ready(function(){
	//Get the modal
	var modal = document.getElementById('modal');

	// Get the button that opens the modal
	var $btn = document.getElementsByClassName("modalBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	$('.modal-btn').click( function(){
		 modal.style.display = "block";
	});

	// When the user clicks on <span> (x), close the modal
	$('.close').on('click', function(){
		 modal.style.display = "none";
	});


	// When the user clicks anywhere outside of the modal, close it
	$(window).on('click', function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	});
	$('.create-project').on('click', function(){
		$.getScript('/projects/new');
		// $('#modal').show();
		// Do this at the end so it doesn't actually click the link!
		return false;
		// var modal = document.getElementById('modal');
	});
	$('.create-step').on('click', function(){
		var project_id = $(this).data('project-id');
		$.getScript('/projects/'+project_id+'/steps/new');
		// $('#modal').show();
		// Do this at the end so it doesn't actually click the link!
		return false;
		// var modal = document.getElementById('modal');
	});

	var step_title = document.getElementsByClassName('step-title');
	$(step_title).on('click', function(){
		var project_id = $(this).data('project-id');
		var step_id = $(this).data('step-id');
		$.getScript('/projects/'+project_id+'/steps/'+step_id+'/edit');

		return false;
	});

	var share = document.getElementsByClassName('share-project');
	$(share).on('click', function(){
		var project_id = $(this).data('project-id');
		var user_id = $(this).data('user-id');
		$.getScript('/projects/'+project_id+'/project_invites/new');
		return false;

	});

	var edit_project = document.getElementsByClassName('edit-project');
	$(edit_project).on('click', function(){
		var project_id = $(this).data('project-id');
		// var step_id = $(this).data('step-id');
		$.getScript('/projects/'+project_id+'/edit');

		return false;
	});

	var project = document.getElementsByClassName('project');
	$(project).on('click', function(){
		// var title = document.getElementsByClassName('dash-title');
		var project_id = $(this).children(1).data('project-id');
		// var step_id = $(this).data('step-id');
		window.location.href="/projects/"+project_id

	});
	$(project).mouseenter(function(){
		$(this).addClass("hover-white");
		$(project).children('.delete').show();
		$(this).mouseleave(function(){
			$(this).removeClass("hover-white");
		});
	});
	var add_project = document.getElementsByClassName('add-project-link');
	$(add_project).mouseenter(function(){
		$(this).addClass("hover-add");
		$(this).mouseleave(function(){
			$(this).removeClass("hover-add");
		});
	});

	var step = document.getElementsByClassName('step');
	$(step).mouseenter(function(){
		$(this).addClass("hover-white");
		$(this).mouseleave(function(){
			$(this).removeClass("hover-white");
		});

	});
	$(step).on('click',function(){
		var edit = $(this).children(1);
		// var edit = document.getElementById('edit-steps');
		// var title = document.getElementsByClassName('dash-title');
		var project_id = $(edit).data('project-id');
		var step_id = $(edit).data('step-id');
		$.getScript('/projects/'+project_id+'/steps/'+step_id+'/edit');

		return false;
	});

	var clipboard = new Clipboard('.clipboard-btn');
  console.log(clipboard);

	(function($) {

  /**
   * Copyright 2012, Digital Fusion
   * Licensed under the MIT license.
   * http://teamdf.com/jquery-plugins/license/
   *
   * @author Sam Sehnert
   * @desc A small plugin that checks whether elements are within
   *     the user visible viewport of a web browser.
   *     only accounts for vertical position, not horizontal.
   */

	  $.fn.visible = function(partial) {

	      var $t            = $(this),
	          $w            = $(window),
	          viewTop       = $w.scrollTop(),
	          viewBottom    = viewTop + $w.height(),
	          _top          = $t.offset().top,
	          _bottom       = _top + $t.height(),
	          compareTop    = partial === true ? _bottom : _top,
	          compareBottom = partial === true ? _top : _bottom;

	    return ((compareBottom <= viewBottom) && (compareTop >= viewTop));

	  };

	})(jQuery);
	$(window).scroll(function(event) {

	  $(".slide").each(function(i, el) {
	    var el = $(el);
	    if (el.visible(true)) {
	      el.addClass("come-in");
	    }
	  });

	});
	var win = $(window);
	var allMods = $(".module");

	// Already visible modules
	allMods.each(function(i, el) {
	  var el = $(el);
	  if (el.visible(true)) {
	    el.addClass("already-visible");
	  }
	});

	win.scroll(function(event) {

	  allMods.each(function(i, el) {
	    var el = $(el);
	    if (el.visible(true)) {
	      el.addClass("come-in");
	    }
	  });

});



	var notice = document.getElementById('notice');
	$(notice).on('click', function(){
		$(this).hide();
	});
	$(window).on('click', function(event) {
		$(notice).hide();
	});



	// $.ajax({
	// 	url: '/users/sign_up',
	// 	success: function(data){
	// 		var home_signup = document.getElementsByClassName('home-signup');
	// 		$(home_signup).append(data);
	// 		return false;
	// 	}
	//
	// });


});


// $('.modal-btn').on('click', function(){
//   var data = $(this).data.val();
//   $.ajax({
// 		type: 'GET',
// 		url: '/projects/new/' + data,
// 		success: function(data){
//       alert('success');
// 		}
// 	});
//   // $.getScript("ajax/new.js")
//   //   .done(function(script,textStatus){
//   //     console.log(textStatus)
//   //   })
// });
