<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'messagePane.jsp' starting page</title>
    
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
    <%!Vector<String> v=new Vector<String>();
    	int i=0;ServletContext application;
    	synchronized void sendMessage(String s)
    	{
    		application=getServletContext();
    		i++;
    		v.add("No."+i+","+s);
    		application.setAttribute("Mess",v);
    	}
     %>
     
     <%
     	String name=request.getParameter("peopleName");
     	String title=request.getParameter("Title");
     	String messages=request.getParameter("messages");
     	if(name==null)
     	{
     		name="guest"+(int)(Math.random()*10000);
     	}
     	if(title==null)
     	{
     		title="无标题";
     	}
     	if(messages==null)
     	{
     		messages="无信息";
     	}
     	String s="姓名"+name+"# "+"标题："+title+"# "+"内容："+"<br>"+messages;
     	sendMessage(s);
     	out.println("您的信息已提交");
      %>
  </body>
</html>
