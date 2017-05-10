<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background=1.jpg>
<center>
 <form method="post" action="RegisterPro.jsp">
  <table border="2">
   <tr height="30">
	<td colspan="2" align="center">회원가입</td>
   </tr>
   <tr height="30">
	<td width="70" align="center">ID</td>
	<td><input type="text" name="id" size="28" style="ime-mode:disabled;" maxlength="10" placeholder="10글자 내"></td>
   </tr>
   <tr height="30">
	<td width="70" align="center">PW</td>
	<td><input type="password" name="passwd" size="28" maxlength="15" placeholder="15글자 내"></td>
   </tr>
   <tr height="30">
	<td width="70" align="center">PWC</td>
	<td><input type="password" name="passwdc" size="28" maxlength="15" placeholder="15글자 내"></td>
   </tr>
   <tr height="30">
	<td width="70" align="center">기수</td>
	<td><input type="text" name="number" size="28" maxlength="5" placeholder="5글자 내"></td>
   </tr>
   <tr height="30">
	<td width="70" align="center">이름</td>
	<td><input type="text" name="name" size="28" maxlength="10" placeholder="10글자 내"></td>
   </tr>
   <tr height="30">
	<td width="70" align="center">계열</td>
	<td align="center">프로그래밍<input type="radio" name="kind">&nbsp;&nbsp;&nbsp;그래픽<input type="radio" name="kind"></td>
   </tr>
   <tr height="30">
	<td colspan="2" align="center">
	<input type="submit" value="가입하기">
	<input type="reset" value="다시입력">
   </td>
  </tr>
 </table>
</form>
</center>
</body>
</html>