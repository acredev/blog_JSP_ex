<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>신규 게시글 작성</title>
</head>
<body>
    <h1>신규 게시글 작성</h1>
    <form action="post_new_send.jsp" method="post">
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="writer"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title"></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="10" cols="20" name="content"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">저장</button>
                    <button type="button" onclick="location.href='post_list.jsp'">목록으로</button>
                    <button type="reset">초기화</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>