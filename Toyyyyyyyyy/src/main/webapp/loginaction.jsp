<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.toy.pro.service.impl.MainDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.toy.pro.service.MainVO" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>험난한 게시판 만들기</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<%
		// 로그인 시 세션에 저장된 userID값이 있으면
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		} 
		// 이미 로그인되어있어 main.jsp로 바로 이동
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		// 아니면 로그인을 진행
		MainDAO userDAO = new MainDAO();
		// 입력한 userID와 userPassword를 MainDAO에 login 함수에 파라미터로 전달해서
		// 사용자 정보 확인
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		// 1일 경우 성공
		if (result == 1) {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			
		}
		// 0일 경우 비밀번호 오류
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		// -1일 경우 아이디 없음
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디.')");
			script.println("history.back()");
			script.println("</script>");
		}
		// -2일 경우 예외처리가 발생한 것으로 DB 오류
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
	
</body>
</html>