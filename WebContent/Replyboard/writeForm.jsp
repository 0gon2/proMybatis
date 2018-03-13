<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<html>
<head>
<title>게시판</title>
</head>



<body>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main w3-container" style="margin-left:260px;margin-top:90px;">
<div class="w3-panel w3-padding-large w3-card-4 w3-light-grey">

	<p class="w3-left" style="padding-left: 30px;"></p>
	<div class="w3-container">
		<b>글쓰기</b> <br>
		<form method="post" name="writeform"
			action="writePro">
			
			<input type="hidden" name="boardid" value="${boardid}">
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="ref" value="${ref}">
			<input type="hidden" name="re_level" value="${re_level}">
			<input type="hidden" name="re_step" value="${re_step}">
			
			
			<table class="w3-table-all" style="width: 70%;">
				<tr>
					<td align="right" colspan="2"><a href="list"> 글목록</a></td>
				</tr>
				<tr>
					<td width="70" align="center">이 름</td>
					<td width="330">
					<input type="text" size="10" maxlength="10"	name="writer"></td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330">
					<c:if test="${num==0 }">
						<input type="text" size="40" maxlength="50" name="subject">
					</c:if>
					<c:if test="${num!=0 }">
						<input type="text" size="40" maxlength="50" name="subject" value="[답글]">
					</c:if>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">Email</td>
					<td width="330">
					<input type="text" size="40" maxlength="30"	name="email"></td>
				</tr>
				<tr>
					<td width="70" align="center">내 용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" align="center">비밀번호</td>
					<td width="330">
					<input type="password" size="8" maxlength="12" name="passwd"></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성"> 
					<input type="button" value="목록보기" OnClick="window.location='list'"></td>
				</tr>
			</table>
			
		</form>
	</div>
	</div>
	</div>
</body>
</html>
