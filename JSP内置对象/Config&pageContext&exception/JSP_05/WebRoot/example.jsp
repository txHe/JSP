<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
    <%
    	Enumeration a=config.getInitParameterNames();
    	
    	while(a.hasMoreElements())
    	{
    		String name=(String)a.nextElement();
    		if(name.equals("pfc")||name.equals("pku"))
    		{
    			String value=config.getInitParameter(name);
    			out.print("参数名："+name+"&nbsp;&nbsp;"+"参数值:"+value+"<br>");
    		}
    	}
    	
     %>
  </body>
</html>
