<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <html>
  <jsp:include page="/sidebar/updateSidebar.jsp" />
  <div class="w3-overlay w3-hide-large" onclick="w3_close()" 
	style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	
  <div class="w3-main w3-container" style="margin-left:250px;margin-top:83px;">
   <p>
  <div class="w3-row">
	<div class="w3-panel w3-padding-large w3-card-4" style="margin-left:20px;width:50%">
 
  	<h4 class="w3-opacity"><i class="fa fa-male"></i>&nbsp;회원정보</h4>
 	 <div class="w3-col m7" style="width:400px" >
		  <div class="form-style-2">
			<div class="form-style-2-heading w3-opacity">개인정보 보호를 위해 비밀번호를 입력해주세요.</div>
			<form action="updateLoginPro" name="myform" method="post">
			<label for="field1"><span>ID <span class="required">*</span></span>${myId } </label>
			<label for="field2"><span>Password <span class="required">*</span></span>
			<input type="password" name="password" style="color: black;" /></label>
			<label><span>&nbsp;</span></label><input type="submit" value="확인" />
			</form>
		</div>
		    </div>  
 	  </div>
	</div>
	
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