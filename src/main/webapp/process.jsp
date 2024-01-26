<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="homework1.RandomNickName" %>
<%@ page import="homework1.UserDB" %>
<%@ page import="homework1.User" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="person" class="homework1.User" scope="request" />

<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
	<title>STOVE</title>
	<!-- favicon logo -->
	<link type="image/x-icon" href="${pageContext.request.contextPath}/resources/icon/stove_favicon.ico" rel="shortcut icon">
	<!-- link css,js -->
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/setting.js?ver=1"></script>
    <style>
    	.wrapper {
    		display : grid;
    		place-items : center;
    		min-height : 100vh;
    	}
    </style>
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
<%
	UserDB userDAO = UserDB.getInstance();
	ArrayList<User> listOfUser = userDAO.getAllUserList();
%>
<body>
	<jsp:setProperty name="person" property="*" />
	
	<%-- 이메일 중복 체크 확인. 중복 시, info.jsp로 페이지가 다시 넘어감 --%>
	<%
	boolean emailFlag = true;
	ArrayList<String> emailList = userDAO.getEmailList();
	
	for(int i=0; i<emailList.size(); i++){
		if(emailList.get(i).equals(person.getUserEmail())){
			emailFlag=false; break;
		}
	}
	%>
	<%-- script 내용이 안되고, sendRedirect가 실행이 되어, 아래 코드로 진행.
	if(emailFlag==false){
		out.println("<script>");
		out.println("alert('이메일이 중복되었습니다. 번거롭더라도 처음부터 다시 입력해주세요.');");
		out.println("</script>");
		response.sendRedirect("info.jsp");
	}
	--%>
	<%
	if(emailFlag==false){
		out.println("<script>");
		out.println("alert('이메일이 중복되었습니다. 번거롭더라도 처음부터 다시 입력해주세요.');");
		out.println("window.location.href='./info.jsp';");
		out.println("</script>");
	}
	%>
	
	<%-- 닉네임 처리 과정 --%>
	<%
	/* 닉네임 랜덤 생성(중복체크) */
	boolean flag = true;
	ArrayList<String> nicknameList = userDAO.getNickNameList();
	
	if(emailFlag==true){
		if(person.getUserNickName().equals("")){
			String tmpNickName;
			
			// 고유 닉네임이 생성될때까지 반복
			while(true){
				tmpNickName = new RandomNickName().makeNickName();
				for(int i=0; i<nicknameList.size(); i++){
					if(tmpNickName.equals(nicknameList.get(i))){
						flag=false;
						break;
					}
				}
				if(flag==true){
					break;
				}
			}
			
			person.setUserNickName(tmpNickName);
		}
		/* 사용자 닉네임 입력 시, 닉네임 중복 체크 후, '중복닉네임_n'으로 구분 */
		else{
			int count = 0;
			String target = person.getUserNickName();
			
			for(int i=0; i<nicknameList.size(); i++){
				if(nicknameList.get(i).contains(target)){
					count++;
				}
			}
			
			if(count>0){
				person.setUserNickName(target+"_"+(count+1));
			}
		}
		userDAO.addUserList(person); // DB 업데이트
	}
	%>
	<div class="wrapper">
		<jsp:include page="header.jsp"/>
		<div>
			<h2>회원가입을 축하합니다!</h2>
		</div>
		<div>
			<p>이메일 : <%=person.getUserEmail() %></p>
			<p>비밀번호 : <%=person.getUserPW() %></p>
			<p>닉네임 : <%=person.getUserNickName() %></p>
		</div>
		<hr style="border-color:black;">
		<h3>데이터베이스에 저장된 모든 유저 정보 출력</h3>
		<div>
			<ul>
				<li>뒤로가기 후, 회원가입 폼 다시 작성 및 제출 시, 전에 작성한 유저 정보 DB에서 확인가능.</li>
				<li>f5키 사용불가. (자바스크립트로 구현.)</li>
				<li>Tomcat서버를 중지 후 다시 시작하면, DB는 초기값만 있음을 확인가능.</li>
			</ul>
		</div>
		<div class="table" style="display:grid; place-items:center;">
			<table border="1" style="text-align:center;">
				<%
				for(int i=0; i<listOfUser.size(); i++){
					out.println("<tr>");
					out.println("<th>"+listOfUser.get(i).getUserEmail()+"</th>");
					out.println("<td>"+listOfUser.get(i).getUserPW()+"</td>");
					out.println("<td>"+listOfUser.get(i).getUserNickName()+"</td>");
					out.println("</tr>");
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>