<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="guestbook.MessageVO"%>
<%@ page import="guestbook.service.MessageListView"%>
<%@ page import="guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>방명록 메시지 목록</title>
</head>
<body>

<form action="writeMessage.jsp" method="post">
아이디<input type="text" name="memberid"> <br>
메시지: <textarea name="content" cols="30" rows="3"></textarea> <br>
<input type="submit" value="메시지 남기기" />
</form>
<hr>
<c:if test="${viewData.isEmpty()}">
등록된 메시지가 없습니다.
</c:if>

<c:if test="${!viewData.isEmpty()}">
	<c:forEach var="message" items="${viewData.messageList}">
	<tr>
		<td>
		메시지 번호: ${message.num} <br/>
		손님 이름: ${message.memberid} <br/>
		메시지: ${message.content} <br/>
		</td>
	</tr>
</c:forEach>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>

</c:if>
</body>
</html>