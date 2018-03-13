<%@page import="board.BoardDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<body>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main w3-container" style="margin-left:260px;margin-top:90px;">
<div class="w3-panel w3-padding-large w3-card-4 w3-light-grey">
	<p class="w3-left" ></p>
			<h5>일반게시판(전체 글:${count })</h5>
		<b class="w3-right">
			<a href="writeForm">글쓰기</a>
		</b><br>
		<c:if test="${count==0 }">
			<table class="table-bordered" width="700">
			<tr class="w3-grey">
			<td align="center">게시판에 저장된 글이 없습니다.</td>
			</table>
		</c:if>
		
		<c:if test="${count!=0 }">
		<table class="w3-table-all" width="700">
			<tr class="w3-grey">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
			</tr>
			<c:forEach var="article" items="${articleList}">
			<tr height="30">
				<td align="center" width="50">${number}</td>
			<c:set var="number" value="${number-1 }"/>
				<td width="250">
			<c:if test="${article.re_level>0}">	
					<img src="../images/level.gif" width="${5 *article.re_level}" height="16">
					<img src="../images/re.gif">
			</c:if>
			<c:if test="${article.re_level==0}">	
 					<img src="../images/level.gif" height="16"> 
 			</c:if>	
 				<a href="content?num=${article.num }&pageNum=${currentPage}">
						${article.subject }</a> 
			<c:if test="${article.readcount>=20 }">
					<img src="../images/hot.gif" border="0" height="16"> 
			</c:if>	
				</td>
				<td align="center" width="100">${article.writer}</td>
				<td align="center" width="150">${article.reg_date}</td>
				<td align="center" width="50">${article.readcount}</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>

		<div class="w3-center">
			<c:if test="${count>0 }">
			
			<c:if test="${startPage>bottomLine }">
			<a href="list?pageNum=${startPage-bottomLine}">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
			<a href="list?pageNum=${i }"> 
				<c:if test="${i!=currentPage }">[${i}]</c:if>
				<c:if test="${i==currentPage }">[${i}]
				<font color='red'></font></c:if>
 			</a>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				<a href="list?pageNum=${startPage+bottomLine}">[다음]</a>
			</c:if>
			
		</c:if>
		</div>
	</div>
	</div>
</body>
</html>