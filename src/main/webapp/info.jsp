<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
	<title>STOVE</title>
	<!-- favicon logo -->
	<link type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/stove_favicon.ico" rel="shortcut icon">
	<!-- link css,js -->
	<link href="${pageContext.request.contextPath}/resources/css/style.css?ver=1" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/script.js?ver=1"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/infoScript.js?ver=1"></script>
    <!-- Meta Setting -->
    <meta http-equiv="X-UA-Compatible" content="IE=Edge; chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="1871132 JKS">
    <meta name="keyword" content="jsp, web, server">
    <meta name="description" content="Homework">
    <%-- JQuery min 링크 --%>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<%-- Bootstrap 4.6 링크 --%>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body onload="set_info()">
	<div class="container">
		<jsp:include page="header.jsp"/>
		
		<div class="container_content">
			<div class="container_body_content">
				<div class="msg_center">
					<div class="msg_body">
						<p style="font-size:22px;">계정정보를 입력해주세요.</p>
					</div>
				</div>
			</div>
			
			<div class="container_form" style="align:center;">
				<form action="process.jsp" method="post">
					<div class="form_content_email" style="margin-bottom : 20px;">
						<div class="form_label" style="text-align : left; margin-bottom : 15px;">이메일</div>
						<div>
							<input type="email" id="email" name="userEmail" size="30" onkeyup="showCheck(this)">
							<button id="email_btn" type="button" class="btn btn-outline-danger" disabled="disabled" onclick="sendEmail()">인증메일 발송</button>
						</div>
					</div>
					<!-- 인증번호는 랜덤 수를 alert창으로 띄우는데, 사용자는 이를 입력하는 것으로 대체. -->
					<div class="form_content_email_check" style="margin-bottom : 20px;">
						<div class="form_label" style="text-align : left; margin-bottom : 15px;">인증번호</div>
						<div>
							<input type="text" id="emailNumber" size="35" disabled="disabled" onkeyup="showCheck(this)">
							<button id="email_num_btn" type="button" class="btn btn-outline-danger" disabled="disabled" onclick="emailNumCheck()">인증 확인</button>
						</div>
					</div>
					<div class="form_content_password" style="margin-bottom : 20px;">
						<div class="form_label" style="text-align : left; margin-bottom : 15px;">
							<span style="margin-right : 330px;">비밀번호</span>
							<img src="${pageContext.request.contextPath}/resources/image/question-square.svg" onmouseover="onTooltip(event)" onmouseout="offTooltip()">
							<div id="commentDiv" style="position:absolute; visibility:hidden;">
								<p>- 공백을 제외한 영어, 숫자, 특수문자를 모두 조합하여 8자 이상 64자 이하로 입력해주세요.</p>
								<p>- 전화번호, 이메일주소, 이름, 생일 또는 연속된 숫자, 문자 등 타인이 쉽게 알아낼 수 있는 비밀번호 사용은 위험합니다.</p>
								<p>- 다른 사이트에서 사용하지 않는 비밀번호를 입력해주세요.</p>
								<p>- 비밀번호는 3~6개월에 한 번씩 주기적으로 변경하는 것이 안전합니다.</p>
							</div>
						</div>
						<div>
							<input type="password" name="userPW" id="passwd" size="50" maxlength="64" onblur="pwdCheck()" onkeyup="pwAlertShow(this)">
							<div id="password_alert_1"></div>
						</div>
					</div>
					<div class="form_content_re_password" style="margin-bottom : 20px;">
						<div class="form_label" style="text-align : left; margin-bottom : 15px;">비밀번호 재입력</div>
						<div>
							<input type="password" id="repasswd" size="50" maxlength="64" onblur="pwdReCheck()" onkeyup="pwAlertShow(this)">
							<div id="password_alert_2"></div>
						</div>
					</div>
					<div class="form_content_nickname" style="margin-bottom : 20px;">
						<div class="form_label" style="text-align : left; margin-bottom : 15px;">닉네임<span style="color : gray;"> (선택)</span></div>
						<div>
							<input type="text" name="userNickName" id="nickname" size="50" maxlength="15" onfocus="nickComment()" onkeyup="nickCommentBlur()" onblur="nickCommentBlur()">
							<p style="color : gray; font-size : 12px;" id="nickComment">닉네임을 입력하지 않은 경우 가입 완료 시 자동으로 생성됩니다.</p>
						</div>
					</div>
					<div class="form_submit" style="margin-top : 20px;">
						<button type="submit" id="btnSubmit" class="btn btn-outline-danger" disabled="disabled" onclick="checkForm()">가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>