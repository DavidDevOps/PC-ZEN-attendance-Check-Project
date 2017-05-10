<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Login.logon.LogonDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ManageCenter</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body background=1.jpg>
<%
	String name = request.getParameter("name");
	int Money = Integer.parseInt(request.getParameter("money"));
	
	LogonDBBean db = LogonDBBean.getInstance();
	db.manageLateMoney(name, Money);
%>
<script>
	alert("성공적으로 차감되었습니다.");
	location.href="Login.jsp"
</script>
</body>
</html>