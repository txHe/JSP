<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <%request.setCharacterEncoding("UTF-8");%>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'a.jsp' starting page</title>
    
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
  <div align="center">
  	<table border="0">
  		<tr>
  			<td>您的姓名:</td>
  			<td><%=request.getParameter("textOne") %></td>
  		</tr>
  		<tr>
  			<td>您的性别:</td>
  			<td><%=request.getParameter("sex") %></td>
  		</tr>
  		<tr>
  			<td>您喜欢的专业：</td>
  			<%String itemName[]=request.getParameterValues("item");
  			if(itemName==null)
  			{
  				out.print("<td>"+"都不喜欢"+"</td>");
  				out.print("</tr>");
  			}
  			else
  			{
  				for(int k=0;k<itemName.length;k++)
  				{
  					out.print("<td>"+itemName[k]+"</td>");
  				}
  				out.print("<tr>");
  			}%>
  		<tr>
  			<td>获取隐藏域的值为：</td>
  			<td><%=request.getParameter("major") %></td>
  		</tr>
  	</table>
  	<a href="example.jsp">返回</a>
  </div>
  </body>
</html>
