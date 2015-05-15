**所谓内置对象指在JSP页面中已经默认内置的Java对象。**它们在JSP页面初始化时生成，由容器实现和管理。这些对象可以直接在JSP页面使用。经常使用的JSP内置对象有**out、request、response、session、application、config、pageContext和exception。**
下面简单介绍下JSP的各类内置对象：

 <h3>1、Out 对象</h3>
 out对象用来向客户端输出数据，被封装为javax.servlet.jsp.JspWriter类对象，通过JSP容器变换为java.io.PrintWriter类对象。Servlet使用java.io.PrintWriter类对象向网页输出数据。
 eg:
 

```
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <body>
    <%
    out.print("<font size=4 color=blue>");
    out.print("JavaScript内置对象");
    out.print("</font>");
     %>
  </body>
</html>
```
 <h3>2、Request 对象</h3>
 HTTP协议是客户与服务器之间提交请求信息（request）与响应信息（response）的通信协议。request对象是从客户端向服务器发出请求，代表客户端请求信息，主要用于接收客户端通过HTTP协议传送给服务器的数据。该对象继承于ServletRequest接口，被包装成HttpServletRequest接口。
| 方法名称       |    说明        |
| ------------- |:-------------:|
| String getParameter(String name)|用来获取用户提交的数据| 
| String[] getParameterValues(String name)|返回指定参数的所有值| 
| setCharacterEncoding(String charset)|设置响应使用字符编码格式|
|void setAttribute(String name,java.lang.Objectvalue）|转发请求时并传数据到转发页面|
| Object getAttribute(String name)|请求转发后的页面使用该方法获取属性值|
|removeAttribute(String name)|把设置在request范围内的属性删除|
|getRemoteAddr()|获得客户端IP地址|
|Cookie[]getCookies()|返回客户端Cookie对象，结果是一个Cookie数组|
eg:

```
/*request.html*/
<!DOCTYPE html>
<html>
  <head>
    <title>requestb.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
    <form action="get.jsp" method="post" name="form1">
    Pleasr Enter your school name:
    <Input type="text" name="schoolname">
    <Input type="submit" name="submit" value= "xxx" >
    
    </form>
  </body>
</html>
```

```
/*get.jsp*/
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'get.jsp' starting page</title>
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="white">
   <p>获取文本框提交的信息：
   <%String textContent=new String(request.getParameter("schoolname")); %>
   <%=textContent %>
 
  </body>
</html>
```
输入学校名字：
![](http://img.blog.csdn.net/20150513210444577)
提交后：
![这里写图片描述](http://img.blog.csdn.net/20150513210614608)
再列一个全面一点的例子：
**用于获取用户填写的表单**
```
/*example.jsp*/
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="javascript">
function checkEmpty(form)
{
	for (i=0;i<form.lengh;i++)
	{
		if(form.elements[i].value=="")
		{
			alert("表单信息不能为空");
			return false;
		}
	}
}
</script>
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
  	<form name="form1" method="post" action="a.jsp" onSubmit="return checkEmpty(form1)">
  		<table border="0">
  			<tr>
  				<td>输入姓名：</td>
  				<td><input type="text" name="textOne"></td>
  			</tr>
  			<tr>
  				<td>选择性别：</td>
  				<td><INPUT type="radio" name="sex" value="男" checked="default">男</td>
  				<td><INPUT type="radio" name="sex" value="女">女</td>
  			</tr>
  			<tr>
  				<td>选择您喜欢的专业：</td>
  				<td><input type="checkbox" name="item" value="NIIT">NIIT</td>
  				<td><input type="checkbox" name="item" value="对日软件">对日软件</td>
  				<td><input type="checkbox" name="item" value="中加合作">中加合作</td>
  			</tr>
  			<tr>
  				<td>隐藏域的值为：</td>
  				<td><input type="hidden" name="major" value="对日软件">对日软件</td>
  		</table>
  		<input type="submit" name="Submit" value="提交">
  		<INPUT TYPE="reset" value="重置">
  	</form>
  </body>
</html>
```

```
/*a.jsp*/
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
```
![这里写图片描述](http://img.blog.csdn.net/20150513214224338)
填写完成后提交：
![这里写图片描述](http://img.blog.csdn.net/20150513214254976)



