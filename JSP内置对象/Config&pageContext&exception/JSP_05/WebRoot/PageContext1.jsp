<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PageContext1.jsp' starting page</title>
    
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
    	ServletRequest req=pageContext.getRequest();
    	String name = req.getParameter("name");
    	out.println("name="+name);
    	pageContext.setAttribute("userName", name);
    	pageContext.getServletContext().setAttribute("sharevalue", "多个页面共享的值");
    	pageContext.getSession().setAttribute("sessionValue","只有在session中才是共享的值");
  		out.println("<br>pageContext.getAttribute('userName')=");
  		out.println(pageContext.getAttribute("userName"));
     %>
     <a href="pageContext2.jsp">下一步---&gt;</a>
  </body>
</html>
