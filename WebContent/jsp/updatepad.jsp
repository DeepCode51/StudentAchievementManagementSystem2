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
    <title>更新密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studentlinfo.css">
    
    <style type="text/css">
    	input{
    		border: 0; 
    		outline-color: white; 
    		background-color: #white
    	}
    	.err{
    		display:none;
    		font-size:12px;
    		text-align:center;
    		color:red;
		}
    </style>  
   
    <script language="JavaScript">
        window.onload=init;
        function init() {
            var pop = "${requestScope.msg}";
            if(pop != ""){
                alert(pop);
            }
        }
    </script>
    <script type="text/javascript">
    	function checkConPwd(obj){
        	var userpwd = document.getElementById("newpass").value;
        	var conpwd = obj.value;
        	if(userpwd != conpwd){
            	document.getElementById("ConPwderr").style.display="block";
            	document.updatepad.studentPad2.style.borderColor="red";
            	document.updatepad.studentPad2.style.color="red";
       	 	}
        	else{
            	document.getElementById("ConPwderr").style.display="none" ;
            	document.register.studentPad2.style.borderColor="black";
            	document.register.studentPad2.style.color="black";
        	}
    	}
    	
    </script>    
</head>
<body>
   <jsp:include page="header2.jsp" />

	<div class="con1">
		<div class="con2">
			<a href="${pageContext.request.contextPath}/jsp/main1.jsp" class="jfj">首页></a> 
			<a href="${pageContext.request.contextPath}/scoreInfo/queryByName" class="jfj">个人中心></a> 
			<span class="jfj">更新密码</span><br><br>
			<h3>更新密码</h3>
			<form id="fm" action="${pageContext.request.contextPath}/login/updatepad" >
				<div style="width: 500px; margin: 20px 400px;">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<table class="table table-bordered">
								<tr>
									<td><label for="oldpass">当前密码</label></td>
									<td><input type="password" name="oldpass" id="oldpass" placeholder="*必填" autocomplete="off" /></td>
								</tr>
								<tr>
									<td><label for="newpass">新密码</label></td>
									<td><input type="password" name="newpass" id="newpass" placeholder="*必填" autocomplete="off" /></td>
								</tr>
								<tr>
									<td><label for="repassword">确认密码</label></td>
									<td><input type="password" name="repassword" id="repassword"  autocomplete="off" placeholder="确认密码必须与新密码一致" onblur="checkConPwd(this)"/>
									<span id="ConPwderr" class="err" >密码不一致</span></td>
								</tr>
							</table>
							<div>
								<input type="submit" id="save" value="保存" class="btn btn-sm btn-info " style="margin: 0 50px 0 150px;">
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
