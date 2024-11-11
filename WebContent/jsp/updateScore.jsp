<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>更新成绩信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">
    <style type="text/css">
    	input{
    		border: 0; 
    		outline-color: white; 
    		background-color: #white
    	}
    </style>      
</head>
<body>
   <jsp:include page="header.jsp" />

	<div class="con1">
		<div class="con2">
			<a href="${pageContext.request.contextPath}/jsp/main.jsp" class="jfj">首页></a> 
			<a href="${pageContext.request.contextPath}/scoreInfo/queryScore" class="jfj">成绩信息></a> 
			<span class="jfj">更新成绩</span><br><br>
			<h3>更新成绩信息</h3>
			<form action="${pageContext.request.contextPath}/scoreInfo/updateScore" name="update">
				<div style="width: 500px; margin: 20px 400px;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<table class="table table-bordered">
								<tr>
									<td>学号</td>
									<td><input type="text" name="studentId" readonly value="${score.studentId}" /></td>
								</tr>
								<tr>
									<td>课程号</td>
									<td><input type="text" name="courseId" readonly value="${score.courseId}" /></td>
								</tr>
								<tr>
									<td>成绩</td>
									<td><input type="text" name="score" value="${score.score}" /></td>
								</tr>
							</table>
							<div>
								<input type="submit" name="update" value="提交" class="btn btn-sm btn-info " style="margin: 0 50px 0 150px;">
								<a href="${pageContext.request.contextPath}/scoreInfo/queryScore" class="btn btn-sm btn-info" style="margin-left: 50px">返回</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp" /> 
</body>
</html>
