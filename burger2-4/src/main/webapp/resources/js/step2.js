function passchk1() {
	if ($('#userpass').val().length < 8) {
		$('.point2').text('')
		$('.point2').text('비밀번호가 8자리보다 작습니다')
		$('.point2').css('color', 'red')
		$('#userpass').focus()
	}
	else{
		$('.point2').text('')
	}
}

function passchk2(){ 
    if($("#userpasschk").val() === $("#userpass").val()){ 
        $(".successPwChk").text("비밀번호가 일치합니다."); 
        $(".successPwChk").css("color", "green"); 
   }else{ 
       $(".successPwChk").text("비밀번호가 일치하지 않습니다."); 
       $(".successPwChk").css("color", "red"); 
   } 
}