<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>


<body>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main w3-container" style="margin-left:260px;margin-top:90px;">
<div class="w3-panel w3-padding-large w3-card-4 w3-light-grey">
	<b>글내용 보기</b>
	<div class="container">
		<table class="w3-table-all" style="width: 80%;">
			<tr height="30">
				<td width="125" align="center">글번호</td>
				<td width="125" align="center">${article.num}</td>
				<td width="125">조회수</td>
				<td width="125" align="center">${article.readcount}</td>
			</tr>
			<tr height="30">
				<td width="125">작성자</td>
				<td width="125" align="center">${article.writer}</td>
				<td width="125" align="center">작성일</td>
				<td align="center" width="125" align="center">${article.reg_date}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">글제목</td>
				<td align="center" width="375" colspan="3">${article.subject}</td>
			</tr>
			<tr height="30">
				<td align="center" width="125">글내용</td>
				<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" class="w3-center"><input type="button"
					value="글수정"
					onclick="document.location.href='nupdateForm?num=${article.num}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
					onclick="document.location.href='deleteForm?num=${article.num}&pageNum=${article.num}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
					onclick="document.location.href='writeForm?num=${num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
					onclick="document.location.href='list?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
</body>
</html>