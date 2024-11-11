<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>添加学生信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">

    <script language="JavaScript" type="text/javascript">
        var first_keywords={};
        first_keywords['信息工程学院']=['计算机科学与技术','软件工程','物联网'];
        first_keywords['商学院']=['电子商务','财务管理','金融'];
        first_keywords['外国语学院']=['日语','韩语','西班牙语'];
        first_keywords['土木建筑学院']=['建筑工程','土木工程'];
        first_keywords['机电工程学院']=['机电工程','车辆工程'];
        first_keywords['艺术设计与传媒学院']=['广告设计','网媒','舞蹈'];
        first_keywords['生物与制药学院']=['生物技术','制药工程'];
        first_keywords['体育学院']=['休闲体育','体育管理学','体育教育'];

        function change() {
            var target1 = document.getElementById("studentDept");
            var target2 = document.getElementById("studentMajor");
            var selected_1 = target1.options[target1.selectedIndex].value;
            while (target2.options.length) {
                target2.remove(0);
            }
            var initial_list = first_keywords[selected_1];
            if (initial_list) {
                for (var i = 0; i < initial_list.length; i++) {
                    var item = new Option(initial_list[i], initial_list[i]);
                    target2.options.add(item);
                }
            }
        }
        
     
    </script>
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
			outline-color: white;/* 轮廓颜色  */
		}
	</style>

</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="con1">
		<div class="con2">
			<a href="${pageContext.request.contextPath}/jsp/main.jsp" class="jfj">首页></a> 
			<a href="${pageContext.request.contextPath}/studentInfo/query" class="jfj">学生信息></a> 
			<span class="jfj">添加学生</span>
			<h3>添加学生信息</h3>
			<form action="${pageContext.request.contextPath}/studentInfo/addstudent" name="addstudent">
				<div style="width: 600px; margin: 20px 380px;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<table class="table table-bordered">
								<tr>
									<td>学号</td>
									<td><input type="text" name="studentId" placeholder="*必填：学号10位" autocomplete="off" /></td>
									<td>姓名</td>
									<td><input type="text" name="studentName" placeholder="*必填" autocomplete="off" /></td>
								</tr>

								<tr>
									<td>年龄</td>
									<td><input type="text" name="studentAge" placeholder="*必填" autocomplete="off" /></td>
									<td>性别</td>
									<td>
										<input type="radio" name="studentSex" value="男" checked /> 男 &nbsp;
										<input type="radio" name="studentSex" value="女" /> 女
									</td>

								</tr>
								<tr>
									<td>出生日期</td>
									<td><input type="date" name="studentBifthday" placeholder="*必填" autocomplete="off" /></td>
									<td>院系</td>
									<td>
										<select name="studentDept" id="studentDept" onchange="change()" >
											<option value="------">-------</option>
											<option value="信息工程学院">信息工程学院</option>
											<option value="外国语学院">外国语学院</option>
											<option value="商学院">商学院</option>
											<option value="土木建筑学院">土木建筑学院</option>
											<option value="机电工程学院">机电工程学院</option>
											<option value="艺术设计与传媒学院">艺术设计与传媒学院</option>
											<option value="生物与制药学院">生物与制药学院</option>
											<option value="体育学院">体育学院</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>专业</td>
									<td>
										<select name="studentMajor" id="studentMajor" >
											<option value="------">-------</option>
										</select>
									</td>
									<td>班级</td>
									<td><input type="text" name="studentClassId" placeholder="*必填" autocomplete="off" /></td>
								</tr>
								<tr>
									<td>电话</td>
									<td colspan="3"><input type="text" id="studentCellPhone" name="studentCellPhone" placeholder="*必填" autocomplete="off" /></td>
								</tr>
							</table>
						</div>
					</div>
					<div>
						<input type="reset" name="reset" value="重置" class="btn btn-sm btn-info" style="margin: 0 50px 0 150px;">
						<input type="submit" name="update" value="提交" class="btn btn-sm btn-info " style="margin: 0 100px;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
