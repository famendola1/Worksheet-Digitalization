// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//  require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap.file-input

document.addEventListener("turbolinks:load", function() {
	  if ($('.btn-file').length === 0) {
	    $('input[type=file]').bootstrapFileInput();
	    $('.file-inputs').bootstrapFileInput();	
	  }
});

$(document).ready(function() {
  // Javascript for button validation
  $(document).on('click', 'input[type=radio]', function() {
    el = $(this);
    col = el.data("col");
    
    el
      .parents(".table")
      .find("input[data-col=" + col + "]")
      .prop("checked", false);
    el.prop("checked", true);
  })

  // Javascript for submit button validation
  $(document).on('click', '#quizSubmit', function() {
		var questions = validate_form();
		if(questions.size == 0 ) {
		 	return;
		 }
		else {
			questionString = "";
			questions.forEach(function(value) {
			  questionString = questionString + ", " + value;
			});
			if (questions.size == 1) {
				alert("Please finish question" + questionString.substring(1) + " before submitting!");

			} else {
				alert("Please finish questions" + questionString.substring(1) + " before submitting!");
			}
			event.preventDefault();
		}
	})

	// Iterates through all answers and checks that they are ranked 
	// Returns 0 if all are checked, otherwise returns first question that isn't finished
	function validate_form() {
		var numbers = new Set();
		scroll = 0;
		for (i = 1; i < 19; i++) {
			$("#q" + i).css("border", "2px solid white");
			for (j = 1; j < 5; j++) {
				name = "q" + i + "a" + j;
				if ($("input[name='" + name + "']:checked").length == 0) {
					numbers.add(i);
					$("#q" + i).css("border", "2px solid red");
					if (scroll == 0) {
						var top = $('#q' + i).position().top;
						$(window).scrollTop( top - 75); //Offset because header blocks some of screen
						scroll = 1;
					}
				}
			}
		}
		return numbers;
	}

	// Prevents arrow keys from moving radio button
	$(document).on('click', 'input[type=radio]', function() {
	    document.addEventListener("keydown", function (e) {
		  if ([37].indexOf(e.keyCode) > -1) { // left

		    e.preventDefault();
		    window.scrollBy(-50, -0);
		  }
		  if ([38].indexOf(e.keyCode) > -1) { //up 
		    e.preventDefault();
		    window.scrollBy(0, -50);
		  }
		  if ([39].indexOf(e.keyCode) > -1) { //right
		    e.preventDefault();
		    window.scrollBy(50, 0);
		  }
		  if([40].indexOf(e.keyCode) > -1) { //down
		    e.preventDefault();
		    window.scrollBy(0, 50);
		  }
		}, false);
  })
});
