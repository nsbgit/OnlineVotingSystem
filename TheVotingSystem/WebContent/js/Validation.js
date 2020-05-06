function validation(){
	var message="This field id required.";
	var conMessage="Password and Confirm Password mismatch";
	var emailMessage="Invalid email id.";
	var phoneMessage="Invalid phone number.";
	var pinMessage="Invalid pin code.";
	var imageMessage="Invalid image format.";
	var fileMessage="Invalid file format.";
	var floatMessage="Invalid format";
	var dateMessage="Date should be dd/mm/yyyy format";
	var passMsg="Minimum 8 characters with atleast 1 numeric(0 to 9),1 alphabetic character(A to Z) and 1 symbol(exp:@,#,*,$..... etc).";
	var amountMessage="Invalid amount.";
	var isFormValid = true;
	$("td span").remove();
	if($("#hid").val() == '2'){
		isFormValid=false;
	}
	if($("#pwd").val() != $("#conPwd").val()){
		
		$("#conPwd").addClass("error");
        $("#conPwd").attr("title",conMessage);	    	        
        $("#conPwd").after("<span class='error'>"+conMessage+"</span>");		        
        $("#conPwd").focus();
        isFormValid = false;	 	       
    } else {
        $("#conPwd").removeClass("error");
        $("#conPwd").removeAttr("title");	
	}
	
	
	$( ".required select").each(function(){ // Note the :text
		if ($.trim($(this).val()).length == 0){
	    	$(this).addClass("error");
	        $(this).attr("title",message);	    	        
	        $(this).after("<span class='error'>"+message+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	
	$( ".required input:text").each(function(){ // Note the :text
		if ($.trim($(this).val()).length == 0){
	    	$(this).addClass("error");
	        $(this).attr("title",message);	    	        
	        $(this).after("<span class='error'>"+message+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	
	$( ".required input:hidden").each(function(){ // Note the :text
		if ($.trim($(this).val()).length == 0){
	    	$(this).addClass("error");
	        $(this).attr("title",message);	    	        
	        $(this).after("<span class='error'>"+message+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	
	$( ".required input:checkbox").each(function(){ // Note the :text
		
		if ($(this).prop("checked") == false){
	    	$(this).addClass("error");
	        $(this).attr("title",message);	    	        
	        $(this).after("<span class='error'>"+message+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	$( ".required input:password").each(function(){ // Note the :text		
		if ($.trim($(this).val()).length == 0){
	    	$(this).addClass("error");
	        $(this).attr("title",message);	    	        
	        $(this).after("<span class='error'>"+message+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	

	$( ".email input:text").each(function(){ // Note the :text		
		if (!validateEmail($.trim($(this).val()))){
	    	$(this).addClass("error");
	        $(this).attr("title",emailMessage);	    	        
	        $(this).after("<span class='error'>"+emailMessage+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});

	$( ".phone input:text").each(function(){ // Note the :text		
		if (!validatePhone($.trim($(this).val()))){
	    	$(this).addClass("error");
	        $(this).attr("title",phoneMessage);	    	        
	        $(this).after("<span class='error'>"+phoneMessage+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	
	$( ".pin input:text").each(function(){ // Note the :text		
		if (!validatePinNo($.trim($(this).val()))){
	    	$(this).addClass("error");
	        $(this).attr("title",pinMessage);	    	        
	        $(this).after("<span class='error'>"+pinMessage+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	
	$( ".password input:password").each(function(){ // Note the :text
				
		if (!validatePassword($.trim($(this).val()))){
	    	$(this).addClass("error");
	        $(this).attr("title",passMsg);	    	        
	        $(this).after("<span class='error'>"+passMsg+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	$( ".date input:text").each(function(){ // Note the :text	
		if ($.trim($(this).val()).length != 0){	
			if (!validationDate($.trim($(this).val()))){
		    	$(this).addClass("error");
		        $(this).attr("title",dateMessage);	    	        
		        $(this).after("<span class='error'>"+dateMessage+"</span>");		        
		        $(this).focus();
		        isFormValid = false;	 	       
		    } else {
		        $(this).removeClass("error");
		        $(this).removeAttr("title");	
		    }
		}
	});
	$( ".amount input:text").each(function(){ // Note the :text	
		if ($.trim($(this).val()).length != 0){	
			if (!validationFloat($.trim($(this).val()))){
		    	$(this).addClass("error");
		        $(this).attr("title",amountMessage);	    	        
		        $(this).after("<span class='error'>"+amountMessage+"</span>");		        
		        $(this).focus();
		        isFormValid = false;	 	       
		    } else {
		        $(this).removeClass("error");
		        $(this).removeAttr("title");	
		    }
		}
	});
	$(".required textarea").each(function(){ // Note the :text
		if ($.trim($(this).val()).length == 0){
	    	$(this).addClass("error");
	        $(this).attr("title",message);	    	        
	        $(this).after("<span class='error'>"+message+"</span>");		        
	        $(this).focus();
	        isFormValid = false;	 	       
	    } else {
	        $(this).removeClass("error");
	        $(this).removeAttr("title");	
	    }
	});
	return isFormValid;
}

function validateEmail($email){
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	  if( !emailReg.test( $email ) ) {
	    return false;
	  } else {
	    return true;
	  }
	
}

function validatePhone($phone){
	var reg = /^[0-9-+]+$/;
	if($phone.length ==10 ){
		if( !reg.test( $phone ) ) {			
		    return false;
		  } else {
		    return true;
		  }
		
	}
	else{
		return false;
	}
}

function validatePinNo($pin){
	var reg = /^[0-9-+]+$/;
	if($pin.length ==6 ){
		if( !reg.test( $pin ) ) {			
		    return false;
		  } else {
		    return true;
		  }
		
	}
	else{
		return false;
	}
}
function validatePassword($pass) {
	
	if($pass.length >0){
		var reg = /[-!$%^&*()_+|~=`{}\[\]:";'<>?,.@\/]/;
		var reg1=/[a-zA-Z]/;
		var reg2=/[0-9]/;
		if($pass.length >7 ){
			
			if( !reg.test( $pass )) {			
			    return false;
			  }
			else if(!reg1.test( $pass ))
			{
				return false;
			}
			else if(!reg2.test( $pass ))
			{
				return false;
			}
			else {
			    return true;
			  }
			
		}
	}
	else{
		return false;
	}
}
function validationDate($date){
	//var reg=/[-+]?[0-9]*\.?[0-9]+/;
	var reg=/^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
	if (!reg.test($date)) {
	   return false;	
	}
	else{
		 return true;
	}
}
function validationFloat($float){
	//var reg=/[-+]?[0-9]*\.?[0-9]+/;
	var reg=/^\d{1,7}(\.\d{1,2})?$/;
	if (!reg.test($float)) {
	   return false;	
	}
	else{
		 return true;
	}
}

function checkAvailiblity(url){	//url ---> url of the servlet
	var userID = $('#userID').val();	
	$.ajax({
	type: "POST",
	url:url,
	data: {userID1:userID}
	}).done(function( result ) {
		//alert(result);
		$("#msgdd").html( result );	
		if(result=="AVAILABLE"){
			$("#btnadd").html( "<input type='submit' value='Sign Up' class='btn' onclick='return validation()' >" );
		} else {
			//alert('Please check availability of user id');
			$("#btnadd").html( "<input type='submit' value='Sign Up' disabled='disabled'  class='btn' onclick='return validation()' >" );
		}
	});	
}

function checkSch(url,value) {
	//alert(url);
	//alert(value);
	$.ajax({
		type:"POST",
		url:url,
		data: {schId:value}
	}).done(function( result ) {
		//alert(result);
		$("#resultid").html(result);
		
		
		/*
		 var html1 = "<tr>"+
		"<td align='center' colspan='4'>"+
		"<input type='hidden' name='count' value='"+ count + "'>" +
			"<input type='submit' onclick='return check()' value='Vote' class='btn'>"+
			"<input type='reset' value='Reset' class='btn'>"+
		"</td>"+
	"</tr></table>";
		 alert(html1);
		 $("#resultid2").html(html1);*/
		
	});	
}




function checkSchResult(url,value) {
	//alert(url);
	//alert('aaaaaaaaaa');
	//alert(value);
	$.ajax({
		type:"POST",
		url:url,
		data: {schId:value}
	}).done(function( result ) {
		//alert(result);
		$("#resultid").html(result);
		
		
		/*
		 var html1 = "<tr>"+
		"<td align='center' colspan='4'>"+
		"<input type='hidden' name='count' value='"+ count + "'>" +
			"<input type='submit' onclick='return check()' value='Vote' class='btn'>"+
			"<input type='reset' value='Reset' class='btn'>"+
		"</td>"+
	"</tr></table>";
		 alert(html1);
		 $("#resultid2").html(html1);*/
		
	});	
}