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
<title>�Խñ� ���</title>
</head>
<body>
	<form action="post_read.jsp" method="get">
		<h1>�Խñ� ���</h1>
		<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				String db_address = "jdbc:mysql://localhost:3306/pratice_board";
				String db_username = "root";
				String db_pwd = "root";
				
				Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
				
				String insertQuery = "SELECT * FROM pratice_board.post order by num desc";
				PreparedStatement psmt = connection.prepareStatement(insertQuery);
				ResultSet result = psmt.executeQuery();%>
				
				<table border="1">
					<tr>
						<td colspan="5">
							<h3>�Խñ� ���� Ŭ���� �� ���� ����</h3>
						</td>
					</tr>
					<tr>
					    <td colspan="5">
					        <button type="button" value="�ű� �� �ۼ�" onClick="location.href='post_new.jsp'">�ű� �� �ۼ�</button>
					    </td>
					</tr>
					<tr>
						<td>��ȣ</td>
						<td>�ۼ���</td>
						<td>����</td>
						<td>�ۼ���</td>
						<td>����</td>
					</tr>
					<%
					while (result.next())
					{%>
						<tr>
							<td><%=result.getInt("num") %></td>
							<td><%=result.getString("writer") %></td>
							<td><a href="post_read.jsp?num=<%=result.getInt("num") %>"><%=result.getString("title") %></a></td>
							<td><%=result.getTimestamp("reg_date") %></td>
							<td>
								<button type="button" value="����" onClick="location.href='post_modify.jsp?num=<%=result.getString("num") %>'">����</button>
								<button type="button" value="����" onClick="location.href='post_delete_send.jsp?num=<%=result.getString("num") %>'">����</button>
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
	</form>
</body>
</html>