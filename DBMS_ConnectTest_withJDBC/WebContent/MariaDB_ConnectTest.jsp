<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MariaDB 연결 드라이버 테스트</title>
</head>
<body>
	<h1>MariaDB 연결 드라이버 테스트</h1>
	<%
		String jdbcUrl = "jdbc:mariadb://localhost:3307/sys";
		String dbId = "root";
		String dbPwd = "root";
		
		try
		{
			Class.forName("org.mariadb.jdbc.Driver");
			Connection connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			out.println("MariaDB 연결 성공");
		}
		catch (Exception ex)
		{
			out.println("연결 오류입니다. 오류 메시지 : " + ex.getMessage());
		}
	%>
</body>
</html>