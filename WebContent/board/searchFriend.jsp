<%@page import="member.SmemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main w3-container" style="margin-left:270px;margin-top:117px;">
<div class="w3-panel w3-padding-large w3-card-4 w3-light-grey">
		<span class="w3-center  w3-large">
		</span>
		<c:if test="${count==0 }">
			<table class="w3-table-all" >
				<tr class="w3-blue">
				<td align="center">검색된 친구가 없습니다.</td>
			</table>
		</c:if>
		<c:if test="${count!=0 }">
		<p class="w3-large" style="font-style:italic;">${hakmungu} 학생들~</p>
		<table width="100%" bordercolor="w3-blue" style="border-collapse:collapse;">
			<tr height="30" class="w3-blue" align="center" >
				<td align="center" width="6%">번호</td>
				<td align="center" width="16%" >이름</td>
				<td align="center" width="11%">생년월일</td>
				<td align="center" width="24%">가입일자</td>
			</tr>
			<c:forEach var="member" items="${articleList }">
			
			<tr height="30" align="center" >
				<td align="center" width="6%">${number}</td>
				<c:set var="number" value="${number-1 }"/>
				<td class="w3-dropdown-hover " 
				align="center" style="width:100%;">${member.name}
		<div class="w3-dropdown-content w3-bar-block w3-card-4" style="right:10px">
				<c:if test="${member.name!=name }">
<a href="mainPage?pageId=${member.memberid }" class="w3-bar-item w3-button">
'${member.name }'님 페이지</a>
<a href="#" class="w3-bar-item w3-button">친구추가</a>
<a href="#" class="w3-bar-item w3-button">쪽지보내기</a>
</c:if>
        </div></td>
			
				<td align="center" width="11%">${member.birthday}</td>
				<td align="center" width="24%">${member.joindate}</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>

		<div class="w3-center">
		<c:if test="${count>0 }">
			<c:if test="${startPage>bottomLine }">
			<a href="searchFriend?pageNum=${startPage - bottomLine}&index=${index }">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage}">
			<a href="searchFriend?pageNum=${i }&index=${index}">
					<c:if test="${i!=currentPage }">[${i}]</c:if>
				<c:if test="${i==currentPage }">[${i}]
				<font color='red'></font></c:if>
 			</a>
			</c:forEach>
			<c:if test="${endPage<pageCount }">
				<a href="searchFriend?pageNum=${startPage + bottomLine}&index=${index }">[다음]</a>
			</c:if>
			
		</c:if>
		
		</div>
		<div class="w3-right">
		    <form action="searchFriend">
     		 <input type="text" placeholder="Friend name" name="friendName">
     		 <input type="hidden" value=${index } name="index">
     		 <input type="submit" class="w3-button w3-blue" value="검색">
   		 </form>
		</div>	
</div>
<footer class="w3-panel w3-padding-32 w3-card-4 w3-light-grey w3-center w3-opacity">
  <p><nav>
  <a href="#" target="_blank">FORUM</a> |
  <a href="#" target="_top">ABOUT</a>
  </nav></p>
</footer>
</div>

<script>
// Script to open and close the sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
function w3_show_nav(name) {
    document.getElementById("menuTut").style.display = "none";
    document.getElementById("menuRef").style.display = "none";
    document.getElementById(name).style.display = "block";
    w3-open();
}
</script>
<script src="https://www.w3schools.com/lib/w3codecolor.js"></script>
<script>
w3CodeColor();
</script>

</body>
</html>