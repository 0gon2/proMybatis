<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String url ="http://www.playretrogames.com/most-played";
String line = "";
try{
	Document doc;
	doc=Jsoup.connect(url).get();
	Elements medial=doc.select("div[class=pNB3]");
	Elements media2=doc.select("script");
	Elements media3=doc.select("link");
	for(Element src : medial){
		String templine = src.toString();
		line+=templine;
	}
	for(Element src : media2){
		String templine = src.toString();
		line+=templine;
	} 
	for(Element src : media3){
		String templine = src.toString();
		line+=templine;
	}

	
}catch(IOException e){
	e.printStackTrace();
}
%>

<body>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" 
style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 270 pixels when the sidebar is visible -->
<div class="w3-main w3-container" style="margin-left:250px;margin-top:120px;">
<h3> 오락실 게임 </h3>
<%=line %>
</div>
</body>

