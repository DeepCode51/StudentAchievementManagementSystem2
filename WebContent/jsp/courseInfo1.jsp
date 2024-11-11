<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>课程信息管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">
          
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   
</head>
<body>
	<jsp:include page="header2.jsp" />
	
	<div class="con1">		
		<div class="con2">
		<a href="${pageContext.request.contextPath}/jsp/main1.jsp" class="jfj">首页></a>
		<span class="jfj">课程信息</span><br><br>
		<div class="row clearfix">
				<div class="col-md-12 column">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>

								<th>课程号</th>
								<th>课程名</th>
								<th>学年</th>
								<th>任课教师</th>
								<th>学分</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach var="course" items="${requestScope.pagemsg.lists}">
							<tr>

								<td>${course.courseId }</td>
								<td>${course.courseName }</td>
								<td>${course.schoolYear }</td>
								<td>${course.teacher }</td>
								<td>${course.creditHour }</td>
								
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
		
		
		<table border="0" cellspacing="0" cellpadding="0" width="900px">
			<tr>
				<td>
					<span>第${requestScope.pagemsg.currPage }/${requestScope.pagemsg.totalPage}页</span> 
					<span>总记录数：${requestScope.pagemsg.totalCount } 每页显示:${requestScope.pagemsg.pageSize}</span> 
					<span> 
						<c:if test="${requestScope.pagemsg.currPage != 1}">
							<a style="color: black;" href="${pageContext.request.contextPath}/courseInfo/queryById?currentPage=1&id=${requestScope.pagemsg.id}">首页</a>
							<a style="color: black;" href="${pageContext.request.contextPath }/courseInfo/queryById?currentPage=${requestScope.pagemsg.currPage-1}&id=${requestScope.pagemsg.id}">上一页</a>
						</c:if> <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
							<a style="color: black;" href="${pageContext.request.contextPath }/courseInfo/queryById?currentPage=${requestScope.pagemsg.currPage+1}&id=${requestScope.pagemsg.id}">下一页</a>
							<a style="color: black;" href="${pageContext.request.contextPath }/courseInfo/queryById?currentPage=${requestScope.pagemsg.totalPage}&id=${requestScope.pagemsg.id}">尾页</a>
						</c:if>
					</span>
				</td>
			</tr>
		</table>
	</div>
	</div>
	
	
	<jsp:include page="footer.jsp" />

</body>
</html>