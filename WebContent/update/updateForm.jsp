<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var httpRequest = null;
	
	function sendRequest(url, params, callback, method){
		httpRequest = new XMLHttpRequest();   
		var httpMethod = method?method:'GET'; /*='GET'  */
		if(httpMethod!='GET' && httpMethod !='POST'){
			httpMethod='GET';
		}
		
		var httpParams = (params==null || params =='')?null:params; 
		var httpUrl = url;                            /* 포스트 방식일때 url */
		if(httpMethod=='GET' && httpParams !=null){
			httpUrl=httpUrl+"?"+httpParams;           /* 겟 방식일때 url */
		}
		
		httpRequest.open(httpMethod,httpUrl, true);
		httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		httpRequest.onreadystatechange=callback;
		httpRequest.send(httpMethod=='POST'?httpParams:null);
	}
	
	function helloToServer(type){
		if(type=='esname'){
			var params ="esname="+encodeURIComponent(document.f.esname.value)+"&index=1&msname=${msname}&hsname=${hsname}&emtid=${emtid}&midid=${midid}&highid=${highid}";
			sendRequest("updateList",params,helloFromServer,"POST");
		}
		if(type=='msname'){
			var params ="msname="+encodeURIComponent(document.g.msname.value)+"&index=2&esname=${esname}&hsname=${hsname}&emtid=${emtid}&midid=${midid}&highid=${highid}";
			sendRequest("updateList",params,helloFromServer,"POST");
		}
		if(type=='hsname'){
			var params ="hsname="+encodeURIComponent(document.h.hsname.value)+"&index=3&esname=${esname}&msname=${msname}&emtid=${emtid}&midid=${midid}&highid=${highid}";
			sendRequest("updateList",params,helloFromServer,"POST");
		} 
	}
	function helloFromServer(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				document.getElementById("aaa").innerHTML=httpRequest.responseText
				document.getElementById("bbb").innerHTML=httpRequest.responseText
				document.getElementById("ccc").innerHTML=httpRequest.responseText
			}
		}
	}
	
</script>

</head>
<body>
<jsp:include page="/sidebar/updateSidebar.jsp" />
<div class="w3-overlay w3-hide-large" onclick="w3_close()" 
style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<div class="w3-main w3-container" style="margin-left:250px;margin-top:85px;">


  <div class="w3-row-padding">
          <div class="w3-card w3-round w3-light-grey " style="margin-top:40px;width:40%">
			  <!-- Contact Section -->
			  <div class="w3-container w3-padding-32" id="contact">
			    <h3>회원정보&nbsp;<i class="w3-large w3-spin fa fa-refresh"></i></h3><br>
			    
			   		아이디:&nbsp;&nbsp; <font size=4.5px color="gray"> ${myId }</font> <br>
			     	이 름:&nbsp;&nbsp;  <font size=4.5px color="gray">${name }</font> <br><br>
			     
			     
			     <form action="updatePro" enctype="multipart/form-data"  method="post">
			     
			     
				    프로필 설정:&nbsp;&nbsp;
				    <input type="file" size="40" name="profile" style="color: red;">
			  		<br><br>
				    배경 설정:&nbsp;&nbsp;
				    <input type="file" size="40" name="background" style="color: red;">
			    
			    
			    
			      <p><input class="w3-button w3-blue w3-section" type="submit" value="수정하기"></p>
			    
			    
			    </form>
			    
			    
			    
			  </div>
          </div>
          
          <div class="w3-card w3-round w3-light-grey " style="margin-top:40px;width:50%">
			  <!-- Contact Section -->
			  <div class="w3-container w3-padding-32" id="contact">
			    <h3>학교정보 수정&nbsp;<i class="w3-large w3-spin fa fa-refresh"></i></h3><br>
			     <form action="ListUpdatePro" target="_blank">
			    
			      <p><input class="w3-input w3-padding-16" 
			      type="text" placeholder="초등학교" name="sch_emt" value="${esname}"
			      onclick="document.getElementById('id02').style.display='block'" required ></p>
			      
			      <p><input class="w3-input w3-padding-16" 
			      type="text" placeholder="중학교" name="sch_mid" value="${msname}"
			      onclick="document.getElementById('id03').style.display='block'" required ></p>
			      
			      <p><input class="w3-input w3-padding-16" 
			      type="text" placeholder="고등학교" name="sch_high" value="${hsname}"
			      onclick="document.getElementById('id04').style.display='block'" required ></p>
			      
			      
			      <p><button class="w3-button w3-blue w3-section" type="submit">변경하기</button></p>
			    </form>
			  </div>
            
     
            
            
          </div>
      </div>
     
<!-- 학교 찾는 모달02(초) -->
<div id="id02" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
      </div>
	<form class="w3-container" name="f">
        <div class="w3-section">
          <label><b>학교검색</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="esname" required>
          <input class="w3-button w3-block w3-blue w3-section w3-padding" type="button" 
          onclick="helloToServer('esname')" value="찾기">
        </div>
      </form>
      <div class="w3-container" id="aaa"></div>
      
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red w3-right">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
      </div>

    </div>
  </div>
<!-- 학교 찾는 모달03(중) -->
<div id="id03" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id03').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
      </div>
	<form class="w3-container" name="g">
        <div class="w3-section">
          <label><b>학교검색</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="msname" required>
          <input class="w3-button w3-block w3-blue w3-section w3-padding" type="button" 
          onclick="helloToServer('msname')" value="찾기">
        </div>
      </form>
      <div class="w3-container" id="bbb"></div>
      
      
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-button w3-red w3-right">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
      </div>

    </div>
  </div>
<!-- 학교 찾는 모달04(고) -->
<div id="id04" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id04').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
      </div>
	<form class="w3-container" name="h">
        <div class="w3-section">
          <label><b>학교검색</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="hsname" required>
          <input class="w3-button w3-block w3-blue w3-section w3-padding" type="button" onclick="helloToServer('hsname')" value="찾기">
        </div>
      </form>
      <div class="w3-container" id="ccc"></div>
      
      
      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id04').style.display='none'" type="button" class="w3-button w3-red w3-right">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
      </div>

    </div>
  </div>

</div>






</body>
</html>