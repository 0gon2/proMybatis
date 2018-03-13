<%@page import="school.SchoolVO"%>
<%@page import="java.util.List"%>
<%@page import="school.SchoolDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
			
</head>
<body>
<c:if test="${index==1 }">
	<c:if test="${esname!=null }">
		 <table class="w3-table-all">
		   <thead>
		     <tr class="w3-blue">
		       <th>School Name</th>
		       <th>Address</th>
		     </tr>
		   </thead>
		    <c:forEach var="school" items="${List}">
				    <tr>
				      <td><a href="signup?emtid=${school.sid}&midid=${midid}&highid=${highid }&esname=${school.sname}&msname=${msname}&hsname=${hsname}">${school.sname}</a></td>
				      <td>${school.saddress}</td>
				    </tr>
		     </c:forEach>
		 </table>
	</c:if>
</c:if>
 
<c:if test="${index==2 }">
	<c:if test="${msname!=null }">
		 <table class="w3-table-all">
		   <thead>
		     <tr class="w3-blue">
		       <th>School Name</th>
		       <th>Address</th>
		     </tr>
		   </thead>
		    <c:forEach var="school" items="${List}">
				    <tr>
				      <td><a href="signup?emtid=${emtid}&midid=${school.sid}&highid=${highid }&esname=${esname}&msname=${school.sname}&hsname=${hsname}">${school.sname}</a></td>
				      <td>${school.saddress}</td>
				    </tr>
		     </c:forEach>
		 </table>
	</c:if>
</c:if>

<c:if test="${index==3 }">
	<c:if test="${hsname!=null }">
		 <table class="w3-table-all">
		   <thead>
		     <tr class="w3-blue">
		       <th>School Name</th>
		       <th>Address</th>
		     </tr>
		   </thead>
		    <c:forEach var="school" items="${List}">
				    <tr>
				      <td><a href="signup?emtid=${emtid}&midid=${midid}&highid=${school.sid}&esname=${esname}&msname=${msname}&hsname=${school.sname}">${school.sname}</a></td>
				      <td>${school.saddress}</td>
				    </tr>
		     </c:forEach>
		 </table>
	</c:if>
</c:if>
</body>
</html>