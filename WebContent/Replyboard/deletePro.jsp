<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<c:if test="${deleteCount==1 }">
		<meta http-equiv="Refresh" content="0;url=list?pageNum=${pageNum}">
	</c:if>
	
	<c:if test="${deleteCount!=1 }">
		<script>
			alert("비밀번호가 맞지 않습니다");
			history.go(-1);
		</script>

	</c:if>
	
	
</body>
</html>