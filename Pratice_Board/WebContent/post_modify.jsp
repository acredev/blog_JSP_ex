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
<title>�� ����</title>
</head>
<body>
    <h1>�� ����</h1>
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
        
        ResultSet result = psmt.executeQuery();
        
        while(result.next())
        {%>
            <form action="post_modify_send.jsp" method="post">
            <input type="hidden" name="num" value="<%=result.getInt("num") %>">
            <table border="1">
                <tr>
                    <td>�ۼ���</td>
                    <td><input type="text" name="writer" value="<%=result.getString("writer") %>"></td>
                </tr>
                <tr>
                    <td>����</td>
                    <td><input type="text" name="title" value="<%=result.getString("title") %>"></td>
                </tr>
                <tr>
                    <td>����</td>
                    <td><textarea rows="10" cols="20" name="content"><%=result.getString("content") %></textarea>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">����</button>
                        <button type="button" onclick="location.href='post_list.jsp'">�������</button>
                        <button type="reset">���󺹱�</button>
                    </td>
                </tr>
            </table>
            </form>
    <%
        }
    }
    catch (Exception ex)
    {
    	out.println("������ �߻��߽��ϴ�. ���� �޽��� : " + ex.getMessage());
    }%>
</body>
</html>