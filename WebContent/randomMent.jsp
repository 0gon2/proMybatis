<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript" type="text/JavaScript">
/* 명언 */
    var wisesaying=new Array();
    wisesaying[0]="\"과거를 지배하는 자가 미래를 지배하여 현재를 지배하는 자가 과거를 지배한다.\"<br/>Who controls the past controls the future.<br/>Who controls the present controls the past<br/>조지 오웰(영국작가)";
    wisesaying[1]="\"재물을 스스로 만들지 않는 사람에게는 쓸 권리가 없듯이<br/>행복도 스스로 만들지 않는 사람에게는 누릴 권리가 없다.\"<br/>We have no more right to consume happiness without producing it<br/>than to consume wealth without producing it.<br/>조지 버나드 쇼(아일랜드 극작가/소설가)";
    wisesaying[2]="\"세상은 고통으로 가득하지만 한편 그것을 이겨내는 일로도 가득차 있다.\"<br/>Although the world is full of suffering,<br/>it is full also of the overcoming of it.<br/>헬렌 켈러(미국 작가/연사)";
    wisesaying[3]="\"사람은 오로지 가슴으로만 올바로 볼 수 있다. 본질적인 것은 눈에 보이지 않는다.\"<br/>It is only with the heart that one can see rightly.<br/>what is essential is invisible to the eye.<br/>앙투안 드 생텍쥐페리(프랑스 작가/비행사)";
    wisesaying[4]="\"사랑은 두 사람이 마주보는 것이 아니라 함께 같은 방향을 바라보는 것이다.\"<br/>Love dose not consist in gazing at each other,<br/>but in looking together in the same direction.<br/>앙투안 드 생텍쥐페리(프랑스 작가/비행사)";
    wisesaying[5]="\"당신이 잘 하는 일이라면 무엇이나 행복에 도움이 된다.\"<br/>Anything you're good at contributes to happiness.<br/>버트랜드 러셀(영국 철학자)";
    wisesaying[6]="\"승리하면 조금 배울 수 있고 패배하면 모든 것을 배울 수 있다.\"<br/>You can learn a little from victory.<br/>you can learn everything from defeat.<br/>크리스티 메튜슨(미국 야구선수)";
    wisesaying[7]="\"스스로를 신뢰하는 사람만이 다른 사람들에게 성실할 수 있다.\"<br/>Only the person who has faith in himself is able to be faithful to others.<br/>에릭 프롬(미국 정신분석학자)";
    wisesaying[8]="\"빛을 퍼뜨릴 수 있는 두가지 방법이 있다. <br/>촛불이 되거나 또는 그것을 비추는 거울이 되는 것이다.\"<br/>There are two ways of spreading light.<br/>To be candle or the mirror that reflects it.<br/>에디스 워튼(미국 작가)";
 
    var random_wisesaying=Math.floor(Math.random()*(wisesaying.length));
</script>
</head>
<body>
   <!-- 명언 출력 -->
   <div class="w3-display-bottommiddle"
   style="text-align:center; font-size:18pt; font-family:'Nanum Brush Script', cursive; 
   color:#888888; margin-bottom: 10%; ">
   <script>document.write(wisesaying[random_wisesaying]);</script>
</div>
</body>
</html>