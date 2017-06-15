$(document).ready(function(){

	// $('.modal-btn').on('click', function(){
	//   $.getScript('new.js')
	// });

	$('.create-project').on('click', function(){
		$.getScript('/projects/new');
		// Do this at the end so it doesn't actually click the link!
		return false;
	})
});
