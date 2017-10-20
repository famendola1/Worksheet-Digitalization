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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs


$(document).ready(function() {

	// Javascript for button validation
  $(document).on('click', 'input[type=radio]', function() {
  	console.log("hereee");
    el = $(this);
    col = el.data("col");
    
    el
      .parents(".question")
      .find("input[data-col=" + col + "]")
      .prop("checked", false);
    el.prop("checked", true);
  })


// Javascript for result calculation
  $(document).on('click', 'input[type=radio]', function() {
    var totalCon = 0, totalCol = 0, totalCom = 0, totalCha = 0; 

	$("input[data-prop='con']:checked").each(function() {
	totalCon += parseInt($(this).val())});
	$("#totalCon").html(totalCon);
	$("#con_val").val(totalCon)

	$("input[data-prop='col']:checked").each(function() {
	totalCol += parseInt($(this).val())});
	$("#totalCol").html(totalCol);
	$("#col_val").val(totalCol)

	$("input[data-prop='com']:checked").each(function() {
	totalCom += parseInt($(this).val())});
	$("#totalCom").html(totalCom);
	$("#com_val").val(totalCom)

	$("input[data-prop='cha']:checked").each(function() {
	totalCha += parseInt($(this).val())});
	$("#totalCha").html(totalCha);
	$("#cha_val").val(totalCha)

  })


  // Javascript for submit button validation
  $(document).on('click', '#quizSubmit', function() {
		var question = validate_form();
		if( question == 0 ) {
		 	return;
		 }
		else {
			alert("Please finish question " + question + " before submitting!");
			event.preventDefault();
		}
	})

	// Iterates through all answers and checks that they are ranked 
	// Returns 0 if all are checked, otherwise returns first question that isn't finished
	function validate_form() {
		var check;
		for (i = 1; i < 19; i++) {
			for (j = 1; j < 5; j++) {
				check = 0;
				name = "q" + i + "a" + j;
				if ($("input[name='" + name + "']:checked").length == 0) {
					return i;
				}
			}
		}
		return 0;
	}

});