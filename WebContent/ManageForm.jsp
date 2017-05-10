<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Manage</title>
<link href="etc/style.css" rel="stylesheet" type="text/css">
</head>
<body background=1.jpg>
<center>
	<form method="post" action="ManageCenter.jsp">
		<table border="3">
			<tr height="30">
				<td width="70" align="center">비밀번호</td>
				<td><input type="password" name="passwd" size="15"></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="center">
					<input type="submit" name="submit" value="확인">
				</td>
			</tr>
		</table>
</form>
</center>
</body>
</html>