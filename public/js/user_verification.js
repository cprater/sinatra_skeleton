$(document).ready(function(){	//Checks inputs of Create Account
	$.get('/list_users', function(serverResponse){
		var user_names = serverResponse;
		
		$('#create-account').on('keyup', function(event){
			event.preventDefault();

			var input = $("input[name='user[name]']").val();

			if ($.inArray(input, user_names))
				$('#bad-name').addClass('hide');
			else
				$('#bad-name').removeClass('hide');
		});

		$('#password-confirmation').on('keyup', function(event){

			var password = $("input[name='user[password]']").val();
			var pass_confirm = $("input[name='user[password_confirmation]']").val();

			if (password != pass_confirm)
				$('#bad-password').removeClass('hide');
			else
				$('#bad-password').addClass('hide');
		});

		//remove/hide submit button
		$('#create-account').on('keyup', function(event){
			event.preventDefault();

		if ($('p.errors').length === $('p.hide').length)
			$('#create-user').removeAttr('disabled');
		else
			$('#create-user').attr('disabled', 'disabled');
		});
		
	},'json');

});