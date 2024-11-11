<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>
    
<html>
<head>
    <title>学生成绩管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">
          
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   
</head>
<body>
	<jsp:include page="header2.jsp" />
	
	<div class="con1">
    	<div class="con2">
    		<a href="${pageContext.request.contextPath}/jsp/main1.jsp" class="jfj">首页></a>
			<span class="jfj">成绩信息</span><br><br>
				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>课程名</th>
									<th>学年</th>
									<th>任课教师</th>
									<th>分数</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.pagemsg.lists}" var="score">
									<tr>
										<td>${score.studentId }</td>
										<td>${score.student.studentName }</td>
										<td>${score.student.studentSex }</td>
										<td>${score.course.courseName }</td>
										<td>${score.course.schoolYear }</td>
										<td>${score.course.teacher }</td>
										<td>${score.score}</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</form>

			<table border="0" cellspacing="0" cellpadding="0" width="900px">
				<tr>
					<td>
						<span>第${requestScope.pagemsg.currPage }/${requestScope.pagemsg.totalPage}页</span>
						<span>总记录数：${requestScope.pagemsg.totalCount } 每页显示:${requestScope.pagemsg.pageSize} </span> 
						<span> <c:if test="${requestScope.pagemsg.currPage != 1}">
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryById?currentPage=1">[首页]</a>
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryById?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
							</c:if> <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryById?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryById?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
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