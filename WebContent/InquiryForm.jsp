<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Login.logon.LogonDBBean,
Login.logon.Data,
java.util.*,
java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	LogonDBBean db = LogonDBBean.getInstance();
	
	List<Data> data = db.InquiryLateMoney(db.selectName(session.getAttribute("id").toString()));
	
	Timestamp time = new Timestamp(System.currentTimeMillis());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Inquiry</title>
</head>
<body background=1.jpg>
<center>
	<table border="3">
		<tr height="30">
			<td colspan="4" align="center">
				출석체크 정보
			</td>
		</tr>
		<tr height="30">
			<td width="70" align="center">아이디</td>
			<td width="70" align="center">이름</td>
			<td width="110" align="center">출석체크 날짜</td>
			<td width="70" align="center">지각비</td>
		</tr>
	<%
		for(Data i : data) {
			out.print("<tr height=\"30\">");
			out.print("<td align=\"center\">" + session.getAttribute("id").toString() + "</td>");
			out.print("<td align=\"center\">" + i.getname() + "</td>");
			out.print("<td align=\"center\">" + i.getTime() + "</td>");
			out.print("<td align=\"center\">" + i.getlate_money() + "</td>");
			out.print("</tr>");
		}
	%>
	</table>
</center>
</body>
</html>