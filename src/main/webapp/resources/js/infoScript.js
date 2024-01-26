/**
 * author : 1871132 JKS
 */
 
var commentDivId;
var emailId, emailNumId, pwId, rePwId;
var email_btn, email_num_btn, submit_btn;
var email_check_num=null;
var email_check_flag = false;
var pw_flag = false;
var re_pw_flag = false;
 
function submitCheck() {
	if(email_check_flag && pw_flag && re_pw_flag){
		submit_btn.disabled=false;
	}
	else{
		submit_btn.disabled=true;
	}
}

function checkForm() {
	if(email_check_flag && pw_flag && re_pw_flag){
		return true;
	}
	else{
		if(!email_check_flag){
			alert("이메일 인증 실패입니다. 다시 이메일 인증을 진행하세요.");
			emailId.focus();
		}
		else if(!pw_flag){
			alert("비밀번호 인증 실패입니다. 다시 비밀번호를 인증하세요.");
			pwId.focus();
		}
		else if(!re_pw_flag){
			alert("비밀번호 재입력 인증 실패입니다. 비밀번호 재입력을 다시 인증해주세요.");
			rePwId.focus();
		}
		return false;
	}
}

function set_info() {
	commentDivId = document.getElementById("commentDiv");
	emailId = document.getElementById("email");
	emailNumId = document.getElementById("emailNumber");
	email_btn = document.getElementById("email_btn");
	email_num_btn = document.getElementById("email_num_btn");
	pwId = document.getElementById("passwd");
	rePwId = document.getElementById("repasswd");
	submit_btn = document.getElementById("btnSubmit");
}

function showCheck(obj) {
	if(obj.value != "") {
		if(obj==emailId)
			email_btn.disabled=false;
		else if(obj==emailNumId)
			email_num_btn.disabled=false;
			
	}
	else{
		if(obj==emailId)
			email_btn.disabled=true;
		else if(obj==emailNumId)
			email_num_btn.disabled=true;
	}
	
	submitCheck();
}

function sendEmail() {
	var emailExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(!emailExp.test(emailId.value)){
		alert("이메일 형식이 올바르지 않습니다. 다시 입력해주세요.");
		emailId.focus();
	}
	else{
		// 6자리수 : 100000 ~ 999999
		email_check_num=Math.floor(Math.random()*(1000000 - 100000))+100000;
		alert("인증번호: "+email_check_num);
		if(emailNumId.disabled==true){
			emailNumId.disabled=false;
		}
	}
}

function emailNumCheck() {
	if(parseInt(emailNumId.value)==email_check_num){
		email_check_flag=true;
		alert("이메일 인증 성공! 다음 단계인 비밀번호를 입력하세요.");
		submitCheck();
		pwId.focus();
	}
	else{
		alert("이메일 인증 실패!\n'인증메일 발송'버튼을 다시 누르고, 인증번호를 다시 입력하세요.");
		emailNumId.value="";
		emailId.focus();
		submitCheck();
	}
}

function pwdCheck() {
	var pwAlert1 = document.getElementById("password_alert_1");
	
    var wordExp = /^.*[a-zA-Z]+.*$/;
    var numExp = /^.*[0-9]+.*$/;
    var specialExp = /^.*[!"#$%&'()*+,\-./:;?@[＼\]^_`{|}<>~=\\]+.*$/;
   
    pwAlert1.style.fontSize="12px";
    
    var wordValid = wordExp.test(pwId.value);
    var numValid = numExp.test(pwId.value);
    var specialValid = specialExp.test(pwId.value);
    
    if(!wordValid || !numValid || !specialValid){
		pw_flag=false;
		pwAlert1.innerHTML="사용할 수 없는 비밀번호입니다.";
		pwAlert1.style.color="red";
	}
	else{
		pw_flag=true;
		if(pwId.value.length < 10){
			pwAlert1.innerHTML = "사용 가능한 비밀번호입니다.(위험)";
			pwAlert1.style.color = "orangered";
		}
		else if(pwId.value.length < 20){
			pwAlert1.innerHTML = "사용 가능한 비밀번호입니다.(안전)";
			pwAlert1.style.color = "green";
		}
		else{
			pwAlert1.innerHTML = "사용 가능한 비밀번호입니다.(매우안전)";
			pwAlert1.style.color = "#069FEE";
		}
	}
	
	if(pwId.value==""){
		pwAlert1.innerHTML="";
		pw_flag=false;
	}
	
	submitCheck();
}

function pwdReCheck(){
	var pw_alert_2 = document.getElementById("password_alert_2");
	
	pw_alert_2.style.fontSize="12px";
	
	if(pw_flag){
		if(rePwId.value == pwId.value){
			pw_alert_2.innerHTML = "비밀번호가 일치합니다.";
			pw_alert_2.style.color="#069FEE";
			re_pw_flag=true;
		}
		else{
			pw_alert_2.innerHTML = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
			pw_alert_2.style.color="orangered";
			re_pw_flag=false;
		}
	}
	else{
		if(rePwId.value != ""){
			pw_alert_2.innerHTML = "비밀번호가 일치하지 않습니다. 다시 입력해주세요.";
			pw_alert_2.style.color="orangered";
			re_pw_flag=false;
		}
		else{
			pw_alert_2.innerHTML = "";
			re_pw_flag=false;
		}
	}
	
	if(rePwId.value==""){
		pw_alert_2.innerHTML = "";
		re_pw_flag=false;
	}
	
	submitCheck();
}

function pwAlertShow(obj) {
	var pwAlert1 = document.getElementById("password_alert_1");
	var pwAlert2 = document.getElementById("password_alert_2");
	
	if(obj==pwId){
		if(obj.value==""){
			pwAlert1.innerHTML="";
		}
	}
	else if(obj==rePwId){
		if(obj.value==""){
			pwAlert2.innerHTML="";
		}
	}
	
	submitCheck();
}

function nickComment() {
	var obj = document.getElementById("nickComment");
	obj.innerHTML = "2~15자 영문 대소문자, 숫자, 한글을 사용하세요";
}

function nickCommentBlur() {
	var nick = document.getElementById("nickname");
	var obj = document.getElementById("nickComment");

	if(nick.value==""){
		obj.innerHTML = "닉네임을 입력하지 않은 경우 가입 완료 시 자동으로 생성됩니다.";
	}
	else{
		obj.innerHTML = "닉네임 중복의 경우, 구별을 위해 '닉네임_숫자'형식으로 임의 지정됩니다.";
	}
}

function onTooltip(e) {
	commentDivId.style.left = e.clientX + "px";
	commentDivId.style.top = e.clientY + "px";
	commentDivId.style.border = "1px solid gray";
	commentDivId.style.visibility = "visible";
	commentDivId.style.width = "400px";
	commentDivId.style.height="300px";
}

function offTooltip() {
	commentDivId.style.visibility="hidden";
}