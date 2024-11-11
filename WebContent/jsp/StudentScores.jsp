<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<html>
<head>
    <title>学生成绩管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">
          
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   
   	<script language="JavaScript">
        window.onload = function() {
            document.getElementById("delSelected").onclick = function () {
                if (confirm("您确定要删除选中信息吗？")) {
                    var flag = false;
                    //判断是否有选中条目
                    var cbs = document.getElementsByName("uid");
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked) {
                            flag = true;
                            break;
                        }
                    }
                    if (flag) {
                        document.getElementById("form1").submit();
                    }
                }
            }

            //获取第一个checkbox
            document.getElementById("firstCb").onclick = function () {
                //获取下摆你列表中所有cd
                var cbs = document.getElementsByName("uid");
                //遍历
                for (var i = 0; i < cbs.length; i++) {
                    //设置cbs[]的check状态 = firstCb.checked
                    cbs[i].checked = this.checked;
                }
            }
        }
        
        function deleteStudent(id) {
	    	if(confirm('确定要删除该学生的成绩?')) {
				$.post("<%=basePath%>scoreInfo/deleteScore",{"id":id},
				function(data){
	            	if(data =="OK"){
	                	alert("删除成功！");
	                	window.location.reload();
	            	}else{
	                	alert("删除失败！");
	                	window.location.reload();
	            	}
	        	});
	    	}
		}
    </script>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="con1">
    	<div class="con2">
    		<a href="${pageContext.request.contextPath}/jsp/main.jsp" class="jfj">首页></a>
			<span class="jfj">成绩信息</span><br><br>
			
        	<form class="form-inline" role="form" action="${pageContext.request.contextPath}/scoreInfo/queryScore">
				<div class="form-group qu">
					<input type="text" id="id" name="id" class="form-control" placeholder="请输入要查询的学号" autocomplete="off"> 
					<input type="submit" class="btn btn-success" value="查询" class="input">
					<a href="${pageContext.request.contextPath}/jsp/addscoreinfo.jsp" class="btn btn-info">添加</a> 
					<a href="javascript:void(0);" id="delSelected" class="btn btn-danger"> 批量删除</a>
				</div>
			</form>
			
			<form action="${pageContext.request.contextPath}/scoreInfo/delselected" id="form1">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th><input type="checkbox" id="firstCb" name="firstCb"></th>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>课程名</th>
									<th>学年</th>
									<th>任课教师</th>
									<th>分数</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.pagemsg.lists}" var="score">
									<tr>
										<td><input type="checkbox" name="uid" id="uid" value="${score.id}"></td>
										<td>${score.studentId }</td>
										<td>${score.student.studentName }</td>
										<td>${score.student.studentSex }</td>
										<td>${score.course.courseName }</td>
										<td>${score.course.schoolYear }</td>
										<td>${score.course.teacher }</td>
										<td>${score.score}</td>
										<td>
											<a href="${pageContext.request.contextPath}/scoreInfo/update?studentId=${score.studentId}&courseId=${score.courseId}" class="btn1 btn-xs glyphicon glyphicon-edit">修改</a>
											<a href="#" onclick="deleteStudent(${score.id})" class="btn2 btn-xs glyphicon glyphicon-trash">删除</a>
										</td>
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
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryScore?currentPage=1&id=${requestScope.pagemsg.id}">[首页]</a>
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryScore?currentPage=${requestScope.pagemsg.currPage-1}&id=${requestScope.pagemsg.id}">[上一页]</a>
							</c:if> <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryScore?currentPage=${requestScope.pagemsg.currPage+1}&id=${requestScope.pagemsg.id}">[下一页]</a>
								<a style="color: black;" href="${pageContext.request.contextPath }/scoreInfo/queryScore?currentPage=${requestScope.pagemsg.totalPage}&id=${requestScope.pagemsg.id}">[尾页]</a>
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