<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'pageContext2.jsp' starting page</title>
    
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
    <%
    	out.println("<br>pageContext.getAttribute('userName')=");
    	out.println(pageContext.getAttribute("userName"));
    	out.println("<br>pageContext.getSession().getAttribute('sessionValue')=");
     	out.println(pageContext.getSession().getAttribute("sessionValue"));
     	out.println("<br>");
     	out.println("<br>pageContext.getServletContext().getAttribute('sessionValue')=");
     	out.println(pageContext.getServletContext().getAttribute("sessionValue"));
     %>
  </body>
</html>
