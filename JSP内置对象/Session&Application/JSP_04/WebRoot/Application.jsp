<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Application.jsp' starting page</title>
    
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
    <form action="messagePane.jsp" method="post" name="form">
    	输入您的名字：<br><input type="text" name="peopleName">
    	 <br>输入您的留言标题:<br>
    	 <input type="text" name="Title">
    	 <br>输入您的留言：<br>
    	 <textarea name="messages" rows="10" cols="36"></textarea>
    	 <br><input type="submit" value="提交信息" name="submit">
    </form>
    
    <form action="showMessage.jsp" method="post" name="form1">
    	 <input type="submit" value="查看留言板" name="look">
    </form>
  </body>
</html>
