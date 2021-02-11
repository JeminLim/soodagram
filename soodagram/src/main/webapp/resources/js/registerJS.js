/**
 * Control register.jsp file
 */

// 각 입력들 toggle 전역변수
var checkEmail = false;
var checkId = false;
var checkName = false;
var checkPw = false;

// Email 입력 체크 - ajax 통신으로 중복 여부 확인
$("#inputEmail").change(function() {
	
	var userInput = $(this).val();
	var url = "/user/duplicateEmail";
	duplicateEmail(userInput, url);
});

// id 입력 체크 - ajax 통신으로 중복 여부 확인
$("#inputId").change(function() {
	
	var userInput = $(this).val();
	var url = "/user/duplicateId";
	duplicateId(userInput, url);
	btnActivate();
	
});

// Name 입력 체크
$("#inputName").change(function(){
	inputCheckName();
	btnActivate();
});

// Password 입력 체크
$("#inputPw").change(function(){
	inputCheckPw();
	btnActivate();
});

function inputCheckName() {
	
	var input = $("#inputName").val();
	
	if(input.length > 0)
		checkName = true;
	else
		checkName = false;
	
	btnActivate();
}

function inputCheckPw() {
	
	var input = $("#inputPw").val();
	
	if(input.length > 0)
		checkPw = true;
	else
		checkPw = false;
	
	btnActivate();
}


function duplicateEmail(input, url) {
	$.ajax({
		url: url,
		data: input,
		type: "POST",
		success : function(data) {
			if(data > 0) {
				checkEmail = false;
				btnActivate();			
			} else if(data == 0){
				checkEmail = true;		
				btnActivate();
			}			
		}
	});
}

function duplicateId(input, url) {
	$.ajax({
		url: url,
		data: input,
		type: "POST",
		success : function(data) {
			if(data > 0) {
				checkId = false;
				btnActivate();			
			} else if(data == 0){
				checkId = true;
				btnActivate();
			}			
		}
	});
}

function btnActivate() {	
	if(checkEmail && checkId && checkPw && checkName)
		$("#submitBtn").prop("disabled", false);
	else
		$("#submitBtn").prop("disabled", true);
}
