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
<body onload="set_load()">
	<div class="container">
		<jsp:include page="header.jsp"/>
		
		<div class="container_body">
			<table class="table table-sm">
				<tbody>
					<tr>
						<td></td>
						<th scope="col">
							<input type="checkbox" id="reg_check_all" value="all" onclick="checkAll(this)">
							<label for="reg_check_all">이용약관 모두 동의</label>
						</th>
						<td></td>
					</tr>
					<tr></tr>
					<tr>
						<td></td>
						<td scope="col">
							<input type="checkbox" id="reg_check_one" value="one" onclick="checkBox(this)">
							<label for="reg_check_one">[STOVE]서비스이용약관</label>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td scope="col">
							<input type="checkbox" id="reg_check_two" value="two" onclick="checkBox(this)">
							<label for="reg_check_two">[STOVE]개인정보 수집 및 이용동의</label>
						</td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td scope="col">
							<input type="checkbox" id="reg_check_three" value="three" onclick="checkBox(this)">
							<label for="reg_check_three">[STOVE]광고성 정보 수신 동의(선택)</label>
						</td>
						<td></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
					<td></td>
						<td>
							<a href="info.jsp">
								<button id="reg_btn" type="button" class="btn btn-outline-danger">동의 후 계속하기</button>
							</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>