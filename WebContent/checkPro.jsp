<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Login.logon.LogonDBBean, Login.logon.Data, java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background=1.jpg>
<%
	LogonDBBean db = LogonDBBean.getInstance();
	Data data = db.select(session.getAttribute("id").toString());
	Timestamp time = new Timestamp(System.currentTimeMillis());
	String sTime = "";	
	long temp = 0;
	//////////////////////////////////////////////////////////////////////////////
	temp = time.getYear() + 1900;
	sTime = "" + temp;
	
	temp = time.getMonth() + 1;
	sTime += "" + temp;
	
	temp = time.getDate();
	sTime += "" + temp;
	//////////////////////////////////////////////////////////////////////////////
	int x = db.selectDate(data.getname(), sTime);
	if(x == 1) { %>
		<script>
			alert("이미 출석체크를 하셨습니다.");
			history.go(-1);
		</script> <%
	}
	else if(x == 0) {
		db.check(data, time); %>
		<script>
			alert("출석체크가 되었습니다.");
			history.go(-1);
		</script> <%
	}
%>
</body>
</html>