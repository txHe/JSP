<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>保存数据到Cookie</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
  request.setCharacterEncoding("UTF-8");
  String name=request.getParameter("Name");
  String major=request.getParameter("major");
  Cookie cookies[]=request.getCookies();
  //存取name变量
  if(cookies!=null)
  {
  	for(int i=0;i<cookies.length;i++)
  	{
  		if(cookies[i].getName().equals("name"))
  			name=cookies[i].getValue();
  	}
  }
  else if(name!=null)
  {
  	Cookie c=new Cookie("name",name);
  	c.setMaxAge(50);
  	response.addCookie(c);
  }	
  //存取major变量
  if(cookies!=null)
  {
  	for(int i=0;i<cookies.length;i++)
  	{
  		if(cookies[i].getName().equals("major"))
  			major=cookies[i].getValue();
  	}
  }
  else if(major!=null)
  {
  	Cookie c=new Cookie("major",major);
  	response.addCookie(c);
  }
   %>
  <body>
  <p>保存数据到cookie的测试</p>
  <form action="cookie.jsp" method="post">
  	姓名:<input type="text" name="Name" value="<%if(name!=null) out.println(name);%>">
  	专业:<input type="text" name="major" value="<%if(major!=null) out.println(major);%>">
  	<input type="submit" value="保存">
  </form>
  your name is <%if(name!=null) out.println(name); %>;
  <br>
  your major is <%if(major!=null) out.println(major); %>;
  </body>
</html>
