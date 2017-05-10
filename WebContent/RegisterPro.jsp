<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="Login.logon.LogonDBBean" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="Login.logon.Data" %>

<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background=1.jpg>

<%
	String id = request.getParameter("id");
	String idU = id.toUpperCase();
	Pattern idP = Pattern.compile(".*[^가-힣a-zA-Z0-9].*");
	Matcher idM = idP.matcher(idU);
	
	String passwd = request.getParameter("passwd");
	String passwdU = passwd.toUpperCase();
	Pattern passwdP = Pattern.compile(".*[^가-힣a-zA-Z0-9].*");
	Matcher passwdM = passwdP.matcher(passwdU);
	
	String passwdc = request.getParameter("passwdc");

	String number = request.getParameter("number");
	String numberU = number.toUpperCase();
	Pattern numberP = Pattern.compile(".*[^가-힣a-zA-Z0-9].*");
	Matcher numberM = numberP.matcher(numberU);
	
	String name = request.getParameter("name");
	String nameU = name.toUpperCase();
	Pattern nameP = Pattern.compile(".*[^가-힣a-zA-Z0-9].*");
	Matcher nameM = nameP.matcher(nameU);
%>

<%
	if(id==null || id.equals("") || idM.matches()){
		%>
			<script>
				alert("아이디에 공백이 있거나, 특수문자가 들어갑니다.");
				history.go(-1);
			</script>
		<%
	}
	
	else if(passwd==null || passwd.equals("") || passwdM.matches()){
		%>
			<script>
				alert("비밀번호에 공백이 있거나, 특수문자가 들어갑니다.");
				history.go(-1);
			</script>
		<%
	}
	else if(number==null || number.equals("") || numberM.matches()){
		%>
			<script>
				alert("기수에 공백이 있거나, 특수문자가 들어갑니다.");
				history.go(-1);
			</script>
		<%
	}
	else if(name==null || name.equals("") || nameM.matches()){
		%>
			<script>
				alert("이름에 공백이 있거나, 특수문자가 들어갑니다.");
				history.go(-1);
			</script>
		<%
	}
	else if(!passwd.equals(passwdc)){
		%>
		<script>
			alert("비밀번호가 같지 않습니다.");
			history.go(-1);
		</script>
	<%
	}
	
	else {
		LogonDBBean db = LogonDBBean.getInstance();
		Data data = new Data();
		
		data.setid(id);
		data.setpasswd(passwd);
		data.setnumber(number);
		data.setname(name);
		
		
		
		int x = db.confirmID(id);
		
		if(x==-1){
			db.register(data); %>
			<script>
				alert("회원가입 성공! 로그인하세요.");
				location.href="Login.jsp";
			</script>
			<%
		}

		else{
			%>
			<script>
				alert("실패. 관리자에게 문의하세요");
				location.href="Login.jsp";
			</script>
			<%
		}
	}
%>
<form method="post" action="Login.jsp">
	<input type="submit" value="확인">
</form>
</body>
</html>