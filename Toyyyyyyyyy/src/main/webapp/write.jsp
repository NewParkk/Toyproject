<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>험난한 게시판 만들기</title>
</head>
<body>
	<%
		// userID를 현재 세션에 있는지 확인하고
		// 존재하면 변수 userID에 기입
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		 
	 %>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 웹 페이지</a>
		</div>
		<!-- 버튼이나 다른 디자인은 설명할 필요가 없어서 ㅋㅋ  -->
		<div class="collapse navbar-collapse" id =bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li class="active"><a href="bbs.jsp">게시판</a>	
			</ul>
			<%
				// 세션에서 받아온 userID가 없으면 
				if(userID == null) {
			%>
			<!-- 초기 화면으로 출력 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="a" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
						
					</ul>
				</li>
			</ul>
			<%
				// 세션에서 받아온 userID가 있으면 
				} else{
			%>
			<!-- 접속한 userID를 세팅해서 로그인한 메인페이지로 이동 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="a" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutaction.jsp">로그아웃</a></li>
						
					</ul>
				</li>
			</ul>
			<%		
				}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="row">
		<form method="post" action="writeaction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>	
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>