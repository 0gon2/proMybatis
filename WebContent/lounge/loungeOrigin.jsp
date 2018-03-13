<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% String name = request.getParameter("name");
	if(name==null) name = "무명";
%>
<%
	String schemt=(String)session.getAttribute("schemt");
	String schmid=(String)session.getAttribute("schmid");
	String schhigh=(String)session.getAttribute("schhigh");
	String aditemt=schemt.substring(0,schemt.length()-3);
	String aditmid=schmid.substring(0,schmid.length()-2);
	String adithigh=schhigh.substring(0,schhigh.length()-3);

%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<style>
.w3-theme {color:#fff !important;background-color:#4CAF50 !important}
.w3-btn {background-color:#4CAF50;margin-bottom:4px}
.w3-code{border-left:4px solid #4CAF50}
.myMenu {margin-bottom:150px}
#me { position : relative; 	left: 30px;}
#you { position : relative; left: 200px;}
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>

<body class="w3-theme-l5">
<div class="w3-top">
  <div class="w3-row w3-white w3-padding">
    <div class="w3-half" style="margin:4px 0 6px 0"><a href='https://www.w3schools.com'><img src='/Project/images/w3schools.png' alt='W3Schools.com'></a></div>
    <div class="w3-half w3-margin-top w3-wide w3-hide-medium w3-hide-small"><div class="w3-right">THE WORLD'S LARGEST WEB DEVELOPER SITE</div></div>
  </div>
  <div class="w3-bar w3-blue-grey w3-large" style="z-index:4;">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-small w3-hover-white w3-padding-16" href="<%=request.getContextPath()%>/mainPage/main.jsp" >메인</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white w3-padding-16" href="<%=request.getContextPath()%>/board/schoolmateList.jsp" >게시판</a>
   <a class="w3-bar-item w3-button w3-hide-medium w3-hover-white w3-padding-16" href="<%=request.getContextPath()%>/header/lounge.jsp" >라운지</a> 
   <!--해더 오른쪽 설정  -->
  	<div class="w3-dropdown-hover w3-hide-medium w3-right">
     <button class="w3-button w3-hide-medium w3-hover-white w3-padding-16 "><i class="fa fa-bars" style="font-size:26.7px"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px;right:1px">
      <a href="<%=request.getContextPath()%>/mainPage/update.jsp" class="w3-bar-item w3-button">회원정보</a>
      <a href="<%=request.getContextPath()%>/start/logoutPro.jsp" class="w3-bar-item w3-button">로그아웃</a>
	<% 
		String memberid=(String)session.getAttribute("myId");
		if(memberid.equals("admin")){
			%>
      		<a href="<%=request.getContextPath()%>/mainPage/admin.jsp" class="w3-bar-item w3-button">[회원관리]</a>
			<% 
		}
	%>
    </div>
 	</div>
  </div>
</div>

<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-collapse w3-animate-left" style="z-index:3;width:270px" id="mySidebar">

 <div class="myMenu">
  <div class="w3-container">
    <h4>라운지</h4>
  </div>
    <a class="w3-bar-item w3-button" href="">...</a>
  <a class="w3-bar-item w3-button" href="">...</a>
  <a class="w3-bar-item w3-button" href="">...</a>
  <a class="w3-bar-item w3-button" href="">...</a>
  </div>
</div>
  <button onclick="document.getElementById('id01').style.display='block'" 
  class="w3-button w3-green w3-large">채팅하기</button>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 270 pixels when the sidebar is visible -->
<div class="w3-main w3-container" style="margin-left:270px;margin-top:117px;">
 
 
 <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:400px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-large w3-transparent w3-display-topright" title="Close Modal" 
        >×</span>
      </div>
		<div class="w3-pale-blue" id="messageWindow" style="margin-top:18.8px;width:400px; height:400px; border: 1px solid grey;
	overflow: auto;"></div><br/>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
		 <input id="inputMessage" type="text" style="width:270px;height:50px;margin-left:20px;margin-top:5px"/>
		<input type="submit" value="전송" onclick="send()" class="w3-button w3-theme" style="height:50px;margin-bottom:3px"/>
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
		textarea.innerHTML += "연결 성공<br>";
		webSocket.send("<%=name%>:입장 하였습니다");
	}
	
	function onError(event){alert(event.data);}
	function send(){
		  textarea.innerHTML += "<div  class='w3-yellow w3-border "
		        +"w3-round-large w3-padding-small' "
		        +" id='me' style='width:180px;'>나: " 
		        + inputMessage.value 
		        + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>";
		  textarea.scrollTop=textarea.scrollHeight;
	      webSocket.send("<%=name%>:"+inputMessage.value);
	      inputMessage.value="";
	}
	

</script>

</body>
</html>