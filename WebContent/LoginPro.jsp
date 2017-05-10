<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="Login.logon.LogonDBBean" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>PC-ZEN</title>
</head>
<body background=1.jpg>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	if(id == null || id.equals("")) {%>
		<script>
			alert("아이디를 입력하세요.");
			history.go(-1);
		</script><%
	}
	else if(passwd == null || passwd.equals("")) {%>
		<script>
			alert("비밀번호를 입력하세요.");
			history.go(-1);
		</script><%
	}
	else {
		LogonDBBean logon = LogonDBBean.getInstance();
		int check = logon.userCheck(id, passwd);
		
		if(check==1){
			session.setAttribute("id",id);
			response.sendRedirect("Login.jsp");
		}else if(check==0){%>
		<script>
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
	<%}else{ %>
		<script>
			alert("없는 아이디입니다.");
			history.go(-1);
		</script>
	<%}
}%>
</body>
</html>