<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� �� ����</title>
</head>
<body>
    <h1>�Խñ� �� ����</h1>
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
		String db_address = "jdbc:mysql://localhost:3306/pratice_board";
		String db_username = "root";
		String db_pwd = "root";
		Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
        
        request.setCharacterEncoding("UTF-8");
        
        String num = request.getParameter("num");
        
        String insertQuery = "SELECT * FROM pratice_board.post WHERE num=" + num;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery(); %>
        
        <table border="1">
            <%
            while(result.next())
            {%>
            	<tr>
            	    <td>��ȣ</td>
            	    <td><%=result.getInt("num") %></td>
            	</tr>
            	<tr>
            	    <td>�ۼ���</td>
            	    <td><%=result.getTimestamp("reg_date") %></td>
            	</tr>
            	<tr>
            	    <td>�ۼ���</td>
            	    <td><%=result.getString("writer") %></td>
            	</tr>
            	<tr>
            	    <td>����</td>
            	    <td><%=result.getString("title") %></td>
            	</tr>
            	<tr>
            	    <td>����</td>
            	    <td><%=result.getString("content") %></td>
            	</tr>
            	<tr>
            	    <td colspan="2">
            	        <button type=button onclick="location.href='post_list.jsp'">�������</button>
            	    </td>
            	</tr>
            	<%            	
            }%>
        </table>
        <%
    }
    catch (Exception ex)
    {
        out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
    }%>

</body>
</html>