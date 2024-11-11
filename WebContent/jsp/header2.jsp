<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>
<html>
<head>
    <title>学生成绩管理系统</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/home_page.css">
          
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="header">

        <div class="header1"><img class="img" src="${pageContext.request.contextPath}/img/top02.png" alt="center"></div>
        <div class="header2">学生成绩管理系统</div>
        <div class="header3">
            <%String name = (String)session.getAttribute("name");out.println(name + " 欢迎你！");%>|
            
            <div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle btn-xs glyphicon glyphicon-cog" data-toggle="dropdown">
					<span class="caret"> </span>
				</button>
				<ul class="dropdown-menu pull-right" role="menu">
					<li><a href="${pageContext.request.contextPath}/studentInfo/queryByName" class="glyphicon glyphicon-user">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath}/login/userexit" class="glyphicon glyphicon-off">退出登录</a></li>
				</ul>
			</div>
            
            
           <%--  <a href="${pageContext.request.contextPath}/login/userexit" class="glyphicon glyphicon-off">退出登录</a> --%>
        </div>
    </div>

 	<div class="nav nav1">
        <a href="${pageContext.request.contextPath}/jsp/main1.jsp">系统首页</a>
        <a href="${pageContext.request.contextPath}/studentInfo/queryByName">个人中心</a>
        <a href="${pageContext.request.contextPath}/courseInfo/queryById">课程信息</a>
        <a href="${pageContext.request.contextPath}/scoreInfo/queryById"> 成绩信息</a>
    </div>
    </body>
    </html>