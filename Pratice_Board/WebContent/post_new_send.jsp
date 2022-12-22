<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://localhost:3306/pratice_board";
    String db_username = "root";
    String db_pwd = "root";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
    
	Timestamp today_date = new Timestamp(System.currentTimeMillis());
    
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	int num = 0;
	
	String insertQuery = "SELECT MAX(num) from pratice_board.post";
	
	PreparedStatement psmt = connection.prepareStatement(insertQuery);
	
	ResultSet result = psmt.executeQuery();
	
	while(result.next())
	{
	    num = result.getInt("MAX(num)") + 1;
	}
	
	insertQuery = "INSERT INTO pratice_board.post(num, title, writer, content, reg_date) VALUES (?, ?, ?, ?, ?)";
	
	psmt = connection.prepareStatement(insertQuery);
	
	psmt.setInt(1, num);
	psmt.setString(2, title);
	psmt.setString(3, writer);
	psmt.setString(4, content);
	psmt.setTimestamp(5, today_date);
	
	psmt.executeUpdate();
	
	response.sendRedirect("post_list.jsp");
}
catch (Exception ex)
{
    out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
}
%>