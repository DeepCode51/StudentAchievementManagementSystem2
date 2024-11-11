<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>更新课程信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">
          
</head>
<body>
   	<jsp:include page="header.jsp" />

	<div class="con1">
		<div class="con2">
			<a href="${pageContext.request.contextPath}/jsp/main.jsp" class="jfj">首页></a> 
			<a href="${pageContext.request.contextPath}/courseInfo/queryCourse" class="jfj">课程信息></a> 
			<span class="jfj">更新课程</span><br> <br>
			<h3>更新课程信息</h3>
			<form action="${pageContext.request.contextPath}/courseInfo/updateCourse" name="updatestudent">
				<div style="width: 500px; margin: 20px 400px;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<table class="table table-bordered">
								<tr>
									<td>课程号</td>
									<td><input type="text" name="courseId" style="border: 0; outline-color: white;" readonly value="${course.courseId}" /></td>
								</tr>
								<tr>
									<td>课程名</td>
									<td><input type="text" name="courseName" style="border: 0; outline-color: white;" value="${course.courseName}" /></td>
								</tr>
								<tr>
									<td>学年</td>
									<td><input type="text" name="schoolYear" style="border: 0; outline-color: white;" value="${course.schoolYear}" /></td>
								</tr>
								<tr>
									<td>任课教师</td>
									<td><input type="text" name="teacher" style="border: 0; outline-color: white;" value="${course.teacher}" /></td>
								</tr>
								<tr>
									<td>学分</td>
									<td><input type="text" name="creditHour" style="border: 0; outline-color: white;" value="${course.creditHour}" /></td>
								</tr>
							</table>
							<div>
								<input type="submit" name="update" value="提交" class="btn btn-sm btn-info " style="margin: 0 50px 0 150px;">
								<a href="${pageContext.request.contextPath}/courseInfo/queryCourse" class="btn btn-sm btn-info" style="margin-left: 50px">返回</a>
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
