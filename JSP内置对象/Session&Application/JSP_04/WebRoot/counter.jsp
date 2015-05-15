<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*" %>
<%!int number=0;
	File file=new File("countNUmber.txt");
	synchronized void countPeople()
	{
		if(!file.exists())
		{
			number++;
			try
			{
				file.createNewFile();
				FileOutputStream out=new FileOutputStream(file);
				DataOutputStream dataOut=new DataOutputStream(out);
				dataOut.writeInt(number);
				out.close();
				dataOut.close();	
			}
			catch(IOException ee){}
		}
		else
		{
			try
			{
				FileInputStream in=new FileInputStream(file);
				DataInputStream dataIn=new DataInputStream(in);
				number=dataIn.readInt();
				number++;
				in.close();
				dataIn.close();
				
				FileOutputStream out=new FileOutputStream(file);
				DataOutputStream dataOut=new DataOutputStream(out);
				dataOut.writeInt(number);
				out.close();
				dataOut.close();
			}
			catch(IOException ee){}
		}
	}
 %>
 <%
 	String str=(String)session.getAttribute("count");
 	if(session.isNew())
 	{
 		out.println("请先访问其他网页");
 	}
 	else
 	{
 		if(str==null)
 		{
 			countPeople();
 			String personCount=String.valueOf(number);
 			session.setAttribute("count", personCount);
 		}
 	}
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'counter.jsp' starting page</title>
    
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
    
  </body>
</html>
