<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MySQL ���� ����̹� �׽�Ʈ</title>
</head>
<body>
	<h1>MySQL ���� ����̹� �׽�Ʈ</h1>
	<%
		Connection connection = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/world";
		String dbId = "root";
		String dbPwd = "root";
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
			out.println("MySQL ���� ����");
		}
		catch (Exception ex)
		{
			out.println("���� �����Դϴ�. ���� �޽��� : " + ex.getMessage());
		}
	%>
</body>
</html>