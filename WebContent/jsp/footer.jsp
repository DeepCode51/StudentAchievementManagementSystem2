<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>
<html>
<head>
    <title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/home_page.css">
</head>
<body>
	<div class="footer">Copyright © 2020-2021 CTF,All Rights Reserved.</div>
</body>
</html>