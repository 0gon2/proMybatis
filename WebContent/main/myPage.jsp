<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.w3-main{
       background-image: url("/projectMVC/fileSave/${myBackground}");
      background-attachment: fixed; 
      }


</style>
<!-- 사이드 바 -->
<div class="w3-sidebar w3-bar-block w3-collapse" 
style="z-index:3;width:260px; margin-top:13px" id="mySidebar">
  <!-- 프로필 -->
     <div class="w3-card w3-round w3-white" style="width:240px; 
     margin-left:10px; margin-top:5px">
        <div class="w3-container">
         <h4 class="w3-center">Profile</h4>
          <c:if test="${myProfile==null }">
         <p class="w3-center">
         <img src="/projectMVC/images/defaultprofile.png" 
         class="w3-circle" style="height:130px;width:130px" ></p>
         </c:if>
         <c:if test="${myProfile!=null }">
         <p class="w3-center">
         <img src="/projectMVC/fileSave/${myProfile}"  
         class="w3-circle" style="height:130px;width:130px" ></p>
         </c:if>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${name }</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
         <a href="schoolBoard">${aditemt}</a>, 
         <a href="schoolBoard?index=2">${aditmid}</a>,
         <a href="schoolBoard?index=3">${adithigh}</a></p>
         <p ><i class="fa fa-male fa-fw "></i>&nbsp;&nbsp;&nbsp;
  			<select onchange="window.location='mainPage?pageId='+this.value">
  			  <option  value="">&nbsp;[친구목록]&nbsp;</option>
  			  <c:forEach items="${friendList }" var="friendList">
			  <option value="${friendList.memberid}" >
			  ${friendList.name}</option>
			  </c:forEach>
			</select>
         </p>
        </div>
      </div>
     
        <div class="w3-card w3-round w3-light-white w3-center">
        <div class="w3-container">
          <p>HOT! 인기게시글</p>
          <p><strong>${hotarticle.subject }</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
</div>

<!-- 몸통부분  -->
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" 
style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 270 pixels when the sidebar is visible -->
<div class="w3-main w3-container" style="margin-left:250px;margin-top:83px;">
 <!-- The Grid -->
 <p>
  <div class="w3-row">
    <!-- Middle Column -->
    <div class="w3-col m7">
    <!-- 게시글 입력란 -->
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white" style="margin-top:20px">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">Social Media template by w3.css</h6>
              
      <form name="postmessage" action="writeMessagePro" method="post">
              <input type="text" class="w3-border w3-padding" 
              placeholder="Status: Feeling Blue" style="width:100%;height:40px;margin-bottom:10px"
              name="content">
              <input type="hidden" name="writerid" value="${myId}">
              <input type="hidden" name="otherid" value="${pageId}">
    		  </form>
              <button type="button" class="w3-button w3-theme" onclick="post()"><i class="fa fa-pencil"></i>  Post</button> 
            </div>
          </div>
        </div>
      </div>
      <c:if test="${viewData.isEmpty()}">
		 <div class="w3-container"><br>
			         <div class="w3-blue w3-center w3-round" style="width:100%">첫 번째 메시지를 남겨보세요 ^^</div>
	  </div>
	  </c:if>
      
     <c:if test="${!viewData.isEmpty()}">
		<c:forEach var="message" items="${viewData.messageList}">
			
			     <div class="w3-container w3-card w3-light-grey w3-round w3-margin">
	      <form action="deleteMessagePro" method="post">
      		<input type="submit" class="w3-right w3-opacity w3-button" value="×">
             <input type="hidden" name="num" value="${message.num}">
  	  	  </form> 
  	  	   <c:if test="${message.profile==null}">
         <img src="/projectMVC/images/defaultprofile.png" 
         class="w3-circle" style="height:55px;width:55px" >
         </c:if>
         <c:if test="${message.profile!=null }">
         <img src="/projectMVC/fileSave/${message.profile}" 
         class="w3-circle" style="height:55px;width:55px" >
         </c:if>
			        <c:if test="${message.name==name }">
			        <font size="5px">&nbsp; ${message.name }</font><br>
			        </c:if>
			        <c:if test="${message.name!=name }">
			        <font size="5px" color="maroon">&nbsp; ${message.name }</font><br>
			        </c:if>
			        <hr class="w3-clear">
			        <p> ${message.content}</p>
			          <div class="w3-row-padding" style="margin:0 -16px">
			        </div>
			        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom">
			        <i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom">
			        <i class="fa fa-comment"></i>  Comment</button> 
			      </div>
			      
		</c:forEach>
		<div class="w3-center">
     		<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
				<a href="mainPage?page=${pageNum}">[${pageNum}]</a>
			</c:forEach>
			</div> 
		</c:if>
      
    
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>오늘의 날씨</p>
          <p><strong>Holiday</strong></p>
          <p>Friday 15:00</p>
          <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
        </div>
      </div>
      <br>
      
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
        <p>ADS</p>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        <p><i class="fa fa-bug w3-xxlarge"></i></p>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
<footer class="w3-panel w3-padding-32 w3-card-4 w3-light-grey w3-center w3-opacity">
  <p><nav>
  <a href="#" target="_blank">FORUM</a> |
  <a href="#" target="_top">ABOUT</a>
  </nav></p>
</footer>

<!-- END MAIN -->
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
function post(){
	var message=document.postmessage;
	message.submit();
	
}

</script>
<script src="https://www.w3schools.com/lib/w3codecolor.js"></script>
<script>
w3CodeColor();
</script>
</html>