<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body background=1.jpg>
<center>
<table border=1>
 <tr class="label">
  <td>기수
  <td>이름
  <td>아이디
  <td>비밀번호
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/daily_check";
		String dbId = "heewon0704";
		String dbPass = "gmldnjs0010";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select * from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String number = rs.getString("number");
			String name = rs.getString("name");
%>
			<tr>
			 <td><%=number %>
			 <td><%=name %>
			 <td><%=id %>
			 <td><%=passwd %>
<%	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null) try{ rs.close(); }catch(SQLException sqle){}
	if(pstmt!=null) try{ pstmt.close(); }catch(SQLException sqle){}
	if(conn!=null) try{ conn.close(); }catch(SQLException sqle){}
}
%>
</table>
</center>
</body>
</html>