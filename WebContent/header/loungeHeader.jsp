<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<style>
 @import url(//fonts.googleapis.com/earlyaccess/jejuhallasan.css); 
.w3-theme {color:#fff !important;background-color:#4CAF50 !important}
.w3-btn {background-color:#4CAF50;margin-bottom:4px}
.w3-code{border-left:4px solid #4CAF50}
.myMenu {margin-bottom:150px}
#me { position : relative; 	left: 30px;}
#you { position : relative; left: 200px;}
html,body,h1,h2,h3,h4,h5 {font-family: "Jeju Hallasan", sans-serif}
/* body {
       background-image: url("/projectMVC/images/background.jpg");
      background-size: cover;
      background-attachment: fixed;
       } */
</style>

<body class="w3-theme-l5">
<div class="w3-top" >
  <div class="w3-row w3-white">
    <div class="w3-half" style="margin:4px 0 5px 0">
    <a href='/projectMVC/gon/mainPage'>
    <img src='/projectMVC/images/top.jpg' alt='W3Schools.com' style="margin-left:10px;margin-top:10px"></a>
    </div>
    <div class="w3-half w3-wide w3-hide-medium w3-hide-small" style="margin-top:25px">
    <div class="w3-right">WELLCOME TO GON'S WORLD </div></div>
  </div>
 
 
  <div class="w3-bar w3-blue" style="height:45px;z-index:4; ">
   <a class="w3-left" href="mainPage" 
   style="margin-top:10px; margin-left:15px; margin-right:20px">
   <img src="/projectMVC/images/school1.png" ></a>
   
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white" 
   href="mainPage" style="height:45px;font-size:18px;">메인</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white" 
   href="schoolBoard" style="height:45px;font-size:18px;" >게시판</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white" 
   href="lounge" style="height:45px;font-size:18px;">라운지</a>
   
   <!-- 알림창 -->
    <div class="w3-dropdown-hover w3-hide-small">
  <button class="w3-button w3-hide-medium" style="padding-bottom:13px">
  <i class="fa fa-bell" style="font-size:22px;margin-top:2px;"></i>
  <c:if test="${reqCount>0}">
  <span class="w3-badge w3-right w3-small w3-red">${reqCount }</span>
  </c:if>
  </button>
   <c:if test="${reqCount>0}">    
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:200px">
     <c:forEach var="reqList" items="${reqList }">
      <a href="mainPage?pageId=${reqList.memberid }" class="w3-bar-item w3-button">${reqList.name}</a>
      </c:forEach>
    </div>
    </c:if>
  </div>
   <!-- 알림창 -->
  
  <!--해더 오른쪽 위 설정  -->
  	<div class="w3-dropdown-hover w3-hide-medium w3-right">
     <button class="w3-button w3-hide-medium w3-hover-white ">
     <i class="fa fa-bars" style="font-size:27px"></i>
     </button>     
     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" 
    style="width:300px;right:1px">
      <a href="updateLoginForm" 
      class="w3-bar-item w3-button">회원정보</a>
      <a href="logout" 
      class="w3-bar-item w3-button">로그아웃</a>

	<c:if test="${myId=='admin'}">
      		<a href="admin" 
      		class="w3-bar-item w3-button">[회원관리]</a>
	</c:if>
    </div>
 	</div>
 	
  </div>


<div class="w3-sidebar w3-bar-block w3-collapse" 
style="z-index:3;width:260px;" id="mySidebar">
  <!-- 프로필 -->
     <div class="w3-card w3-round w3-white" style="width:240px; margin-left:10px; margin-top:10px">
    <button onclick="document.getElementById('id01').style.display='block'" 
 			 class="w3-button w3-green w3-large w3-half" >채팅하기</button>
    <button onclick="window.location='gogame'" 
 			 class="w3-button w3-red w3-large w3-half"  >게임하기</button>
      </div>
      <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:400px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-large w3-transparent w3-display-topright" title="Close Modal" 
        >×</span>
      </div>
		<div class="w3-pale-blue" id="messageWindow" style="margin-top:18.8px;width:100%; height:400px;
	overflow: auto;"></div><br/>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		 <input id="inputMessage" type="text" style="width:270px;height:50px;margin-left:20px;margin-top:5px"/>
		<input type="submit" value="전송" onclick="send()" class="w3-button w3-theme" style="height:50px;margin-bottom:3px"/>
      </div>

    </div>
  </div>
</div>
</div>

<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket= new WebSocket('ws://211.238.142.29:8080<%=request.getContextPath()%>/weball');
	var inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror=function(event){onError(event)};
	webSocket.onopen=function(event){onOpen(event)};
	webSocket.onmessage=function(event){onMessage(event)};
	
	function onMessage(event){
		 textarea.innerHTML += "<div  id='you'  class='w3-white "
			    +"w3-border w3-round-large w3-padding-small' "
			    +"style='width:180px;'>"
			    +event.data + "</div><br>";
		 textarea.scrollTop=textarea.scrollHeight;
	}
	
	function onOpen(event){
		textarea.innerHTML += "'${name}'님이 입장하였습니다.<br>";
		webSocket.send("${name}:입장 하였습니다");
	}
	
	function onError(event){alert(event.data);}
	function send(){
		  textarea.innerHTML += "<div  class='w3-yellow w3-border "
		        +"w3-round-large w3-padding-small' "
		        +" id='me' style='width:180px;'>${name}: " 
		        + inputMessage.value 
		        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>";
		  textarea.scrollTop=textarea.scrollHeight;
	      webSocket.send("${name}:"+inputMessage.value);
	      inputMessage.value="";
	}
	

</script>



</body>
</html>