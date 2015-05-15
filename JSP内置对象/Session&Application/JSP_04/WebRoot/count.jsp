<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'count.jsp' starting page</title>
    
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
    这里是结账处：
    <%
    	String personName=(String)session.getAttribute("customerName");
    	out.print("<br>您的姓名:" + personName);
    	Enumeration enumGoods=session.getAttributeNames();
    	out.print("<br>购物车中的商品：<br>");
    	while(enumGoods.hasMoreElements())
    	{
    		String key=(String)enumGoods.nextElement();
    		String goods=(String)session.getAttribute(key);
    		if(!(goods.equals(personName)))
    			out.print(goods+"<br>");
    	}
     %>
     <p>
     <a href="book.jsp">请继续购买书籍！</a>
     <br><a href="example.jsp">修改姓名！</a>
  </body>
</html>
