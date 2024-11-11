<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/studentlinfo.css">
          <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

   	<jsp:include page="header2.jsp" /> 

	<div class="con1">
    	<div class="con2">
			<div style="width: 800px; margin: 20px 200px;">
				<a href="${pageContext.request.contextPath}/jsp/main.jsp"
					style="color: gray; fint-size: 18px">首页></a> <span
					style="color: gray; fint-size: 18px">课程信息</span><br>
				<br>
				<h2>个人信息</h2>
				<div style="margin: 0 0 30px 630px;width: 180px;">
				<a href="${pageContext.request.contextPath}/jsp/updatepad.jsp?studentPad=${student.studentPad}" class="btn btn-sm btn-info glyphicon glyphicon-edit">修改密码</a>
				<a href="${pageContext.request.contextPath}/studentInfo/update2?studentId=${student.studentId}"  class="btn btn-sm btn-warning glyphicon glyphicon-repeat">修改信息</a><br>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-bordered">
							<tr>
								<td>学号</td>
								<td>${student.studentId }</td>
								<td>姓名</td>
								<td>${student.studentName }</td>
							</tr>
							<tr>
								<td>性别</td>
								<td>${student.studentSex }</td>
								<td>年龄</td>
								<td>${student.studentAge }</td>
							</tr>
							<tr>
								<td>出生日期</td>
								<td>${student.studentBifthday }</td>
								<td>院系</td>
								<td>${student.studentDept }</td>
							</tr>
							<tr>
								<td>专业</td>
								<td>${student.studentMajor }</td>
								<td>班级</td>
								<td>${student.studentClassId }</td>
							</tr>
							<tr>
								<td>电话</td>
								<td>${student.studentCellPhone }</td>
								<td>密码</td>
								<td>******</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			


		</div>
	</div>

   <jsp:include page="footer.jsp" /> 

</body>
</html>
