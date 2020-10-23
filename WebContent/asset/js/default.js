jQuery(document).ready(function($) {
	"use strict";

	$('.form input').keyup(function(){
	    var valeur = $(this).val();
	    if (valeur.length<1) {
	      $(this).prev('.valid').html("Entrée invalide!").fadeIn('slow');
	      $(this).addClass('error');
	    }else{
	      $(this).prev('.valid').fadeOut('slow');
	      $(this).removeClass('error');
	    }
	});

	$('#phone').keyup(function(){
    	var e = $(this);
    	if(!$.isNumeric(e.val()) && e.val()!=""){
    		e.addClass('error');
    		e.val('');
    	}else if($.isNumeric(e.val())){ 
    		e.removeClass('error'); 
    	}
    });

	$('.form').submit(function(){

		if(valide_form()){
			return true;
		}else{
			return true;
		}
	});

	function valide_form() {
		var input = $('input:text,input:password,input[type="email"],textarea,select');
		var valid = true;

		for (var i = 0; i < input.length; i++) {

			var valeur = $(input[i]).val();

	        if (valeur.trim().length<1) {
	          $(input[i]).prev('.valid').html("Entrée invalide!").fadeIn('slow');
	          $(input[i]).addClass('error');
	          valid = false;
	        }else{
	          $(input[i]).prev('.valid').fadeOut('slow');
	          $(input[i]).removeClass('error');
	          valid = true;
	        }
		}
		return valid;
	}


	$('.return,.col .alert').click(function() {
		$(this).slideUp('slow');
	});

	$('input:file').change(function() {
		$(this).prev('label').text($(this).val()).fadeIn('slow');
	});

});

