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
html,body,h1,h2,h3,h4,h5 {font-family: "Jeju Hallasan", sans-serif}

</style>

<style type="text/css">
.form-style-2{

}
.form-style-2-heading{
	font-style: italic;
	border-bottom: 2px solid #ddd;
	margin-bottom: 20px;
	font-size: 15px;
	padding-bottom: 3px;
}
.form-style-2 label{
	display: block;
	margin: 0px 0px 15px 0px;
}
.form-style-2 label > span{
	width: 100px;
	font-weight: bold;
	float: left;
	padding-top: 8px;
	padding-right: 5px;
}
.form-style-2 span.required{
	color:red;
}
.form-style-2 .tel-number-field{
	width: 40px;
	text-align: center;
}
.form-style-2 input.input-field{
	width: 48%;
	
}

.form-style-2 input.input-field, 

 .form-style-2 .select-field{
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	border: 1px solid #C2C2C2;
	box-shadow: 1px 1px 4px #EBEBEB;
	-moz-box-shadow: 1px 1px 4px #EBEBEB;
	-webkit-box-shadow: 1px 1px 4px #EBEBEB;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	padding: 7px;
	outline: none;
}
.form-style-2 .input-field:focus, 
  
.form-style-2 .select-field:focus{
	border: 1px solid #0C0;
}

.form-style-2 input[type=submit],
.form-style-2 input[type=button]{
	border: none;
	padding: 8px 15px 8px 15px;
	background: #FF8500;
	color: #fff;
	box-shadow: 1px 1px 4px #DADADA;
	-moz-box-shadow: 1px 1px 4px #DADADA;
	-webkit-box-shadow: 1px 1px 4px #DADADA;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
}
.form-style-2 input[type=submit]:hover,
.form-style-2 input[type=button]:hover{
	background: #EA7B00;
	color: #fff;
}

</style>
<body class="w3-theme-l5">
  
  
	<div class="w3-sidebar w3-bar-block w3-collapse" 
style="z-index:3;width:260px; margin-top:13px" id="mySidebar">
  <!-- 프로필 -->
     <div class="w3-card w3-round w3-white" style="width:240px; 
     margin-left:10px; margin-top:5px">
      <div class="w3-container">
         <h4 class="w3-center">Profile</h4>
         <c:if test="${profile==null }">
         <p class="w3-center">
         <img src="/projectMVC/images/defaultprofile.png" 
         class="w3-circle" style="height:130px;width:130px" ></p>
         </c:if>
         <c:if test="${profile!=null }">
         <p class="w3-center">
         <img src="/projectMVC/fileSave/${profile}" 
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
		  <div class="w3-padding-50 w3-large w3-text-grey" style="margin-top:20px ">
		  <div class="w3-card w3-round w3-white" style="width:240px; margin-left:10px;margin-top:10px ">
		    <a href="#" class="w3-bar-item w3-button">아이디 찾기</a>
		    <a href="#" class="w3-bar-item w3-button">비밀번호 찾기</a>
		    <a href="#" class="w3-button w3-block w3-white w3-left-align">
		      회원정보 <i class="fa fa-caret-down"></i>
		    </a>
		    <div class="w3-bar-block w3-padding-large w3-medium">
		      <a href="#" class="w3-bar-item w3-button">회원정보 변경</a>
		      <a href="#" class="w3-bar-item w3-button">비밀번호 변경</a>
		      <a href="leave" class="w3-bar-item w3-button">탈퇴하기</a>
		    </div>
		   
		  	</div>
			</div>
		 	</div>







</body>
</html>
