<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if(session.getAttribute("name")==null)
    response.sendRedirect("login.jsp");%>

<html>
<head>
    <title>更新学生信息</title>
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
  
  	<style type="text/css">
  		input{
  			border: 0; 
  			outline-color: white; 
  			background-color: #white;
  		}
  	</style>
</head>
<body>
   <jsp:include page="header2.jsp" />

	<div class="con1">
		<div class="con2">
			<a href="${pageContext.request.contextPath}/jsp/main1.jsp" class="jfj">首页></a>
        	<a href="${pageContext.request.contextPath}/studentInfo/queryByName" class="jfj">个人中心></a>
			<span class="jfj">更新个人信息</span>
			<h3>更新个人信息</h3>
			<form action="${pageContext.request.contextPath}/studentInfo/updatestudent2" name="updatestudent">
				<div style="width: 600px; margin: 20px 380px;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<table class="table table-bordered">
								<tr>
									<td>学号</td>
									<td><input type="text" name="studentId" readonly value="${student.studentId}" /></td>
									<td>姓名</td>
									<td><input type="text" name="studentName" value="${student.studentName}" /></td>
								</tr>
								<tr>
									<td>年龄</td>
									<td><input type="" name="studentAge" value="${student.studentAge}" /></td>
									<td>性别</td>
									<td>
										<input type="radio" name="studentSex" value="男" ${student.studentSex == '男' ? 'checked':''} /> 男&nbsp; 
										<input type="radio" name="studentSex" value="女" ${student.studentSex == '女' ? 'checked':''} /> 女
									</td>
								</tr>
								<tr>
									<td>出生日期</td>
									<td><input type="date" name="studentBifthday" value="${student.studentBifthday}" /></td>
									<td>院系</td>
									<td>
										<select name="studentDept" id="studentDept" onchange="change()">
											<option value="信息工程学院" ${student.studentDept == '信息工程学院' ? 'selected':''}>信息工程学院</option>
											<option value="外国语学院" ${student.studentDept == '外国语学院' ? 'selected':''}>外国语学院</option>
											<option value="商学院" ${student.studentDept == '商学院' ? 'selected':''}>商学院</option>
											<option value="土木建筑学院" ${student.studentDept == '土木建筑学院' ? 'selected':''}>土木建筑学院</option>
											<option value="机电工程学院" ${student.studentDept == '机电工程学院' ? 'selected':''}>机电工程学院</option>
											<option value="艺术设计与传媒学院" ${student.studentDept == '艺术设计与传媒学院' ? 'selected':''}>艺术设计与传媒学院</option>
											<option value="生物与制药学院" ${student.studentDept == '生物与制药学院' ? 'selected':''}>生物与制药学院</option>
											<option value="体育学院" ${student.studentDept == '体育学院' ? 'selected':''}>体育学院</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>专业</td>
									<td>
										<select name="studentMajor" id="studentMajor">
											<option value="软件工程" ${student.studentMajor == '软件工程' ? 'selected':''}>软件工程</option>
											<option value="计算机科学与技术" ${student.studentMajor == '计算机科学与技术' ? 'selected':''}>计算机科学与技术</option>
											<option value="日语" ${student.studentMajor == '日语' ? 'selected':''}>日语</option>
											<option value="电子商务" ${student.studentMajor == '电子商务' ? 'selected':''}>电子商务</option>
											<option value="财务管理" ${student.studentMajor == '财务管理' ? 'selected':''}>财务管理</option>
											<option value="建筑工程" ${student.studentMajor == '建筑工程' ? 'selected':''}>建筑工程</option>
											<option value="机电工程" ${student.studentMajor == '机电工程' ? 'selected':''}>机电工程</option>
											<option value="广告设计" ${student.studentMajor == '广告设计' ? 'selected':''}>广告设计</option>
											<option value="生物技术" ${student.studentMajor == '生物技术' ? 'selected':''}>生物技术</option>
											<option value="休闲体育" ${student.studentMajor == '休闲体育' ? 'selected':''}>休闲体育</option>
										</select>
									</td>
									<td>班级</td>
									<td><input type="text" name="studentClassId" value="${student.studentClassId}" /></td>
								</tr>
								<tr>
									<td>电话</td>
									<td colspan="3"><input type="text" name="studentCellPhone" value="${student.studentCellPhone}" /></td>
								</tr>
							</table>
							<div>
								<input type="submit" name="update" value="提交" class="btn btn-sm btn-info " style="margin: 0 50px 0 150px;">
								<a href="${pageContext.request.contextPath}/studentInfo/queryByName" class="btn btn-sm btn-info" style="margin-left: 50px">返回</a>
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
