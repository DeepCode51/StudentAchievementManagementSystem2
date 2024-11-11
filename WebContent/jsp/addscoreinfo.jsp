<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>添加成绩信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">

	<script language="JavaScript">
        window.onload=init;
        function init() {
            var pop = "${requestScope.msg}";
            if(pop != ""){
                alert(pop);
            }
        }
    </script>
	<style>
		input{
			border: 0; 
			outline-color: white; /* 轮廓颜色  */
		}
		
	</style>
	<!-- 禁用自动完成 ：autocomplete="off" -->
	
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="con1">
		<div class="con2">
			<a href="${pageContext.request.contextPath}/jsp/main.jsp" class="jfj">首页></a> 
			<a href="${pageContext.request.contextPath}/scoreInfo/queryScore" class="jfj">成绩信息></a> 
			<span class="jfj">添加成绩</span><br><br>
			<h3>添加学生成绩</h3>
			<form action="${pageContext.request.contextPath}/scoreInfo/addscore"
				name="addstudent">

				<div style="width: 500px; margin: 20px 400px;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<table class="table table-bordered">
								<tr>
									<td>学号</td>
									<td><input type="text" name="studentId" placeholder="*必填" autocomplete="off" /></td>
								</tr>
								<tr>
									<td>课程号</td>
									<td><input type="text" name="courseId" placeholder="*必填" autocomplete="off" /></td>
								</tr>
								<tr>
									<td>成绩</td>
									<td><input type="text" name="score" placeholder="*必填" autocomplete="off" /></td>
								</tr>
							</table>
						</div>
					</div>
					<div>
						<input type="reset" name="reset" value="重置" class="btn btn-sm btn-info" style="margin: 0 50px 0 150px;">
						<input type="submit" name="update" value="提交" class="btn btn-sm btn-info " style="margin: 0 50px;">
					</div>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>
