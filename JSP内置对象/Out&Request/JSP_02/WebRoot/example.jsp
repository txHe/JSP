<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="javascript">
function checkEmpty(form)
{
	for (i=0;i<form.lengh;i++)
	{
		if(form.elements[i].value=="")
		{
			alert("表单信息不能为空");
			return false;
		}
	}
}
</script>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'example.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<form name="form1" method="post" action="a.jsp" onSubmit="return checkEmpty(form1)">
  		<table border="0">
  			<tr>
  				<td>输入姓名：</td>
  				<td><input type="text" name="textOne"></td>
  			</tr>
  			<tr>
  				<td>选择性别：</td>
  				<td><INPUT type="radio" name="sex" value="男" checked="default">男</td>
  				<td><INPUT type="radio" name="sex" value="女">女</td>
  			</tr>
  			<tr>
  				<td>选择您喜欢的专业：</td>
  				<td><input type="checkbox" name="item" value="NIIT">NIIT</td>
  				<td><input type="checkbox" name="item" value="对日软件">对日软件</td>
  				<td><input type="checkbox" name="item" value="中加合作">中加合作</td>
  			</tr>
  			<tr>
  				<td>隐藏域的值为：</td>
  				<td><input type="hidden" name="major" value="对日软件">对日软件</td>
  		</table>
  		<input type="submit" name="Submit" value="提交">
  		<INPUT TYPE="reset" value="重置">
  	</form>
  </body>
</html>
