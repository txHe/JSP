**response对象与request对象正好相反，所包含的是服务器向客户端作出的应答信息。** response被包装成HttpServletResponse接口，它封装了JSP的响应，被发送到客户端以响应客户端的请求。因输出流是缓冲的，所以可以设置HTTP状态码和response头。

|方法名称|说明|
|----|:----:|
|addCookie(Cookie cookie)|添加一个Cookie对象，用来保存客户端用户信息。|
|setContentType(String contentType)|设置响应MIME类型|
|setCharacterEncoding(String charset)|设置响应使用字符编码方式|
|setHeader(String name,String value)|设定指定名字的HTTP文件头的值。response.setHeader("refresh","5")，每5秒页面刷新一次|
|setRedirect(URL)|将用户重定向到一个不同的页面URL。|
|String encodeURL(String url)|将url予以编码，回传包含sessionId的URL。好处是可以将用户的session追加到网址的末尾，也就是能够保证用户在不同的页面的session对象是一致的。|
|String encodeRedirectURL（String url)|对于使用sendRedirect()方法的URL进行编码|
**refresh的例子：**

```
/*refresh.jsp*/
<html>
  <body>
    <p>response 自动刷新</p>
    <%response.setHeader("Refresh", "10");
    out.println(""+new java.util.Date());
    %>
  </body>
</html>
```
每隔10s重新加载页面本身。

**cookie的例子：**

```
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
```
![这里写图片描述](http://img.blog.csdn.net/20150513225721373)

redirect的例子:

```
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'redirect.jsp' starting page</title>
    
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
    	String address= request.getParameter("where");
    	if(address!=null)
    	{
    		if(address.equals("pfc"))
    			response.sendRedirect("http://www.baidu.com");
    		else if(address.equals("pku"))
    			response.sendRedirect("http://www.baidu.com");
    		else if(address.equals("buaa"))
    			response.sendRedirect("http://www.baidu.com");
    	}
     %>
     <b>Please select:</b><br>
     
     <form action="redirect.jsp" method="get">
     	<select name="where">
     		<option value="pfc" selected>go to pfc
     		<option value="pku" selected>go to pku
     		<option value="buaa" selected>go to buaa
     	</select>
     	<input type="submit" value="go" name="submit">
     </form>
  </body>
</html>
```
按键即可跳转。
