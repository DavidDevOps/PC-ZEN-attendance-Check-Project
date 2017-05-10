<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Login.logon.LogonDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ManageCenter</title>
<link href="etc/style.css" rel="stylesheet" type="text/css">
</head>
<body background=1.jpg>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	LogonDBBean db = LogonDBBean.getInstance();
	int check = db.manageSelectpasswd(passwd);
	
	if(check == 1) { %>
		<script>
			alert("비밀번호를 입력하세요.");
			history.go(-1);
		</script> <%
	}
	else if(check == -1) { %>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script> <%
	}
	else{ %>
	<center>
		<table border="3">
				<tr height="30">
					<td align="center">관리</td>
				</tr>
				<tr height="30">
					<td align="center">
						<input type="button" value="지각비관리하기" onclick="location.href='ManageMoneyForm.jsp'">
						<input type="button" value="멤버확인" onclick="location.href='viewMember.jsp'">
					</td>
				</tr>
			</table>
	</center>
	<%
	}
%>

</body>
</html>