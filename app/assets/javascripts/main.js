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

	var step = document.getElementsByClassName('step-title')
	console.log(step)
	$(step).on('click', function(){
		var project_id = $(this).data('project-id');
		var step_id = $(this).data('step-id')
		$.getScript('/projects/'+project_id+'/steps/'+step_id+'/edit');

		return false;
	});




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
