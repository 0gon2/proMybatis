<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 
<style>
* {
  box-sizing: border-box;
}

body {
   background-color: #ffffff;
       background-image: url("/projectMVC/images/background.jpg");
      background-size: cover;
      background-attachment: fixed;  
}

#regForm {
  background-color: #ffffff;
  margin: 50px auto;
  font-family: Raleway;
  padding: 5px;
  width: 40%;
  min-width: 300px;
  border: 1px solid #888;
}

h1 {
  text-align: center;  
}

input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;  
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
}
</style>
<body>

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
			sendRequest("searchList",params,helloFromServer,"POST");
		}
		if(type=='msname'){
			var params ="msname="+encodeURIComponent(document.g.msname.value)+"&index=2&esname=${esname}&hsname=${hsname}&emtid=${emtid}&midid=${midid}&highid=${highid}";
			sendRequest("searchList",params,helloFromServer,"POST");
		}
		if(type=='hsname'){
			var params ="hsname="+encodeURIComponent(document.h.hsname.value)+"&index=3&esname=${esname}&msname=${msname}&emtid=${emtid}&midid=${midid}&highid=${highid}";
			sendRequest("searchList",params,helloFromServer,"POST");
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

<!-- 로그인폼  -->
<button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-green w3-large">Login</button>

<div class="w3-container">
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
      </div>

      <form class="w3-container" action="">
        <div class="w3-section">
          <label><b>Username</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="memberid" required>
          <label><b>Password</b></label>
          <input class="w3-input w3-border" type="text" placeholder="Enter Password" name="password" required>
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
          <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
      </div>

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
<!-- 회원가입 폼  -->
<form id="regForm" action="signupPro">
	<input type="hidden" name="emtid" value="${emtid}">
	<input type="hidden" name="midid" value="${midid}">
	<input type="hidden" name="highid" value="${highid}">
  <h1>Register:</h1>
  <!-- One "tab" for each step in the form: -->
  <div class="tab">School name:
   <p><input oninput="this.className = ''" name="sch_emt"
   onclick="document.getElementById('id02').style.display='block'" value="${esname}"></p>
   <p><input oninput="this.className = ''" name="sch_mid"
   onclick="document.getElementById('id03').style.display='block'" value="${msname}"></p>
   <p><input oninput="this.className = ''" name="sch_high"
   onclick="document.getElementById('id04').style.display='block'" value="${hsname}"></p>
  </div>
  <div class="tab">User Info:
    <p><input placeholder="name" oninput="this.className = ''" name="name"></p>
    <p><input placeholder="ex) 920315" oninput="this.className = ''" name="birthday"></p>
  </div>
  
  <div class="tab">Create ID: 
    <p><input placeholder="ID" oninput="this.className = ''" name="memberid"></p>
	<p><input placeholder="password" type="password" oninput="this.className = ''" name="password"></p>
  </div>
  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">이전</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">다음</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
</form>




<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab
function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "회원가입";
    
  } else {
    document.getElementById("nextBtn").innerHTML = "다음";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    alert("가입 완료");
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}

</script>

</body>
</html>