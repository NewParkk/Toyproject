<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.toy.pro.service.impl.MainDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.toy.pro.service.MainVO" scope="page"/>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>험난한 게시판 만들기</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<%
		// 회원가입을 진행했는데 세션에 userID 값이 있으면
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		} 
		// 이미 로그인 되어있다는 알람 출력 후 main.jsp로 이동
		if (userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		// 아이디, 비밀번호, 이름, 성별, 이메일 중 하나라도 null값 (빈값)이면 입력되지 않았다고 알림 출력 후
		// 회원가입 페이지로 다시 이동
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");		
			script.println("history.back()");
			script.println("</script>");
		} else{
			MainDAO userDAO = new MainDAO();
			// 회원가입할 사용자 정보를 MainDAO에 join 함수에 파라미터로 넘김
			// user는 위에 설정한 jsp:useBean과 setProperty로 데이터 저장
			int result = userDAO.join(user);
			// -1일 경우 PK에 의해 중복된 아이디를 입력못하도록 함
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다..')");		
				script.println("history.back()");
				script.println("</script>");
			}
			// 회원가입이 되면 세션을 저장하고 main.jsp로 넘김
			else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			
		}
		
	%>
	
</body>
</html>