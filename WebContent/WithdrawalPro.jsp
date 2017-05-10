<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Login.logon.LogonDBBean" %>
<%@ page import="Login.logon.Data" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	String id = session.getAttribute("id").toString();
	String passwd = request.getParameter("passwd");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Withdrawal</title>
</head>
<body background=1.jpg>
<%
	if(passwd == null || passwd.equals("")) { %>
		<script>
			alert("비밀번호를 입력하세요.");
			history.go(-1);
		</script> <%
	}
	LogonDBBean db = LogonDBBean.getInstance();
	Data data = db.select(id);
	int check = db.selectpasswd(id, passwd);
	
	if(check == 1) {
		db.withdrawal(data);
		session.invalidate(); %>
		<script>
			alert("성공적으로 탈퇴되었습니다.");
			location.href="Login.jsp";
		</script> <%
	}
	else if(check == 0) { %>
		<script>
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script> <%
	}
%>
</body>
</html>