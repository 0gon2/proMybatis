<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script >
		var input = confirm('정말로 탈퇴하시겠습니까?');
		if(input==true){
			alert('탈퇴 완료');
			<%
				MemberDAO dbPro = MemberDAO.getInstance();
				dbPro.deleteArticle((String)session.getAttribute("myId"));
				session.invalidate();
			%> 
			location.href="/projectMVC/gon/loginForm";
		}
	</script>
</body>
</html>