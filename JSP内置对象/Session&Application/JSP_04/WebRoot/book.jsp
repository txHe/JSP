<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'book.jsp' starting page</title>
    
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
    <A href="example.jsp">修改姓名!</A>
    <p>
  	  请选择您要购买的书：
  	  	<form>
  	  		<input type="checkbox" name="item" value="Java">Java
  	  		<input type="checkbox" name="item" value="JSP">JSP
  	  		<input type="checkbox" name="item" value="Structs">Structs
  	  		<p>
  	  		<input type="submit" name="submit" value="提交">
  	  	</form>
  	  	<%
  	  		String book[]=request.getParameterValues("item");
  	  		if(book!=null)
  	  		{
  	  			for(int k=0;k<book.length;k++)
  	  			{
  	  				session.setAttribute(book[k], book[k]);	
  	  			}
  	  		}
  	  	 %>
  	  	 <a href="count.jsp">去结账！</a>
  </body>
</html>
