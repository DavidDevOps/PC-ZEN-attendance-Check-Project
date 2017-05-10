<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background=1.jpg onload="go_time()">
<center>
<h2>PC-ZEN</h2>
<div id="clock"></div>
<script type="text/javascript">

function go_time(){
	var now = new Date();
	var year = now.getFullYear(); //년
	var month = now.getMonth()+1; //월
	var day = now.getDate(); //일
	var hour = now.getHours();  //시
	var min = now.getMinutes();  //분
	var sec = now.getSeconds();  //초
	
	document.getElementById("clock").innerHTML 
	= year+"년 "+ month+"월 "+day+"일 "+hour+":"+min+":"+sec
	//id가 clock인 html에 현재시각을 넣음
	
	setTimeout("go_time()", 1000);
	//1초마다 해당 펑션을 실행함.
}
</script>
<p>


<%
	String id = "";
	try{
		id = (String)session.getAttribute("id");
		if(id == null || id.equals("")){
%>
<form method="post" action="LoginPro.jsp">
  <table border="2">
   <tr height="30">
	<td colspan="2" align="center">로그인</td>
   </tr>
   <tr height="30">
	<td width="70" align="center">ID</td>
	<td><input type="text" name="id" size="28" maxlength="10" placeholder="10글자 내"></td>
   </tr>
   <tr height="30">
	<td width="70" align="center">PW</td>
	<td><input type="password" name="passwd" size="28" maxlength="15" placeholder="15글자 내"></td>
   </tr>
   <tr height="30">
	<td colspan="2" align="center">
	 <input type="submit" value="로그인">
	 <input type="button" value="회원가입" onclick="location.href='RegisterForm.jsp'">
	</td>
   </tr>
  </table>
 </form>
<%
	}else{
%>
<form method="post" action="Logout.jsp">
 <table border="2">
  <tr height="30">
   <td align="center"><b><%=id %></b>님이 로그인 하셨습니다.</td>
  </tr>
  <tr height="30">
   <td align="center">
    <input type="submit" value="로그아웃">
    <input type="button" value="출석체크" onclick="location.href='checkPro.jsp'">
    <input type="button" value="탈퇴." onclick="location.href='WithdrawalForm.jsp'">
    <input type="button" value="출석정보" onclick="location.href='InquiryForm.jsp'">
    <input type="button" value="관리" onclick="javascript:window.location='ManageForm.jsp'">
   </td>
  </tr>
 </table>
</form>

<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</center> 
</body>
</html>