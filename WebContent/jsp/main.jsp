<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>
<html>
<head>
    <title>学生信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home_page.css">
          
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="d" id="bodyContainer">
		<div style="background: #ffffff;margin: 0px 60px 0px 60px;padding: 50px 150px;height: 77%;">
			<div>
				<img alt="" src="../img/20160526021127672.jpg">
			</div>
			<div>
				<h1>欢迎访问学生成绩管理系统！</h1>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>