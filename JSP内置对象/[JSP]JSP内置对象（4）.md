###1、Config对象 ###
config对象被封装成javax.servlet.ServletConfig接口，表示Servlet的配置。当一个Servlet初始化时，容器把某些信息通过此对象传递给Servlet。

 **config对象常用方法：** 

1、getInitParameter(String name)：获取名字为name的初始参数值

2、Enumeration getInitParameterNames():获取这个JSP所有初始参数的名字

3、getServletContext():返回执行者Servlet上下文

example.jsp: 例子需要在web.xml中添加参数
```
<html>
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

```

###2、PageContext对象###

pageContext对象被封装成javax.servlet.jsp.PageContext接口，它为JSP页面包装页面上下文，提供存取所有关于JSP程序执行时期所要用到的属性方法。
**pageContext对象常用方法:**
|方法名称|说明|
|---|---|
|forward(String relativeURL)|把页面转发到另一个页面或者Servlet组件上|
|getAttribute(String name[,int scope])|获取属性的值|
|getException()|返回当前的exception对象|
|getRequest()|返回当前的request对象|
|getResponse()|返回当前的response对象|
|getServletConfig()|返回当前页面的ServletConfig对象|
|getServletContext()|返回ServletContext对象，这个对象对所有页面都是共享的|
|getSession()|返回当前页面的session对象|
|setAttribute(String name,String value)|设置属性值|
|removeAttribute(String name)|删除指定属性|
|invalidate()|返回ServletContext对象，全部销毁|
**关于页面共享的例子：**

**pageContext.jsp**

```
<html>
 <body>
   	<form method=post action="PageContext1.jsp">
   		<table>
   			<tr>
   				<td>name</td>
   				<td><input type=text name=name></td>
   			</tr>
   			<tr colspan=2>
   				<td><input type=submit value="log in"></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>
```
**pageContext1.jsp**
```
<html>
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
```
**pageContext2.jsp**

```
<html>
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
```
![这里写图片描述](http://img.blog.csdn.net/20150515212317485)
**pageContext.jsp**
![这里写图片描述](http://img.blog.csdn.net/20150515212412666)
**pageContext1.jsp**
![这里写图片描述](http://img.blog.csdn.net/20150515212420357)
**pageContext2.jsp**

###3、exception对象###
如果在JSP页面出现没有捕获的异常，就会生成exception对象，并把它传送到在page指令中设定的错误页面中，然后在错误处理页面中处理相应的exception对象。exception对象只有在错误页面（在页面指令里isErrorPage=true）才可以使用。
**exception常用方法：**
|方法名称|说明|
|---|---|
|getMessage()|获取异常消息字符串|
|toString()|以字符串形式返回对异常的描述|

**exception.jsp:**

```
<%@ page language="java" import="java.util.*" errorPage="error.jsp" pageEncoding="UTF-8"%>
<html>
  <body>
     <%!int a[]={0,1,2};%>
     <%=a[3]%>
  </body>
</html>
```
**error.jsp:**

```
<%@ page language="java" import="java.util.*" isErrorPage="true"  pageEncoding="UTF-8"%>
<html>
  <body>
    <h2>
    <font color="red">
    	错误原因：
    	<%=exception.getMessage() %>
    	<p>
    	<%=exception.toString() %>
    </font>
    </h2>
  </body>
</html>
```
![这里写图片描述](http://img.blog.csdn.net/20150515213213704)

