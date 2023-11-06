<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>험난한 게시판 만들기</title>
</head>
<body>
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
		<div class="collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>	
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="a" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<!-- 회원가입을 들어왔을 때 회원가입 문구를 active -->
						<li class="active"><a href="join.jsp">회원가입</a></li>
						
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<!-- 12크기를 lg사이즈로 4씩 나눔 -->
		<div class="col-lg-4">
		</div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<!-- post방식으로 action으로 보냄 -->
				<!-- <form method="post" action="joinupdate.jsp"> -->
				<form method="post" action="joinaction.jsp">
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<!-- 아이디 입력 -->
						<input type="text" class="form-control"placeholder="아이디" name="userID" maxlength="20" value="">
					</div>
					<div class="form-group">
						<!-- 비밀번호 입력 -->
						<input type="password" class="form-control"placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<!-- 이름 입력 -->
						<input type="text" class="form-control"placeholder="이름" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center">
						<!-- 성별은 라디오박스 형태로 선택 -->
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label> 
						</div>
					</div>
					<div class="form-group">
						<!-- 이메일 입력 (이메일 형식으로) -->
						<input type="email" class="form-control"placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<!-- 회원가입 버튼으로 디자인 변경 후 form 태그의 action으로 이동 -->
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>