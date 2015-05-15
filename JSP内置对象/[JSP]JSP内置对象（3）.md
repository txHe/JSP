###3、Session对象###
在web应用中，当一个客户首次访问服务器上的某个JSP页面时，JSP引擎（比如Tomcat）将为这个客户创建一个session对象，当客户关闭浏览器离开之后，session对象被注销。

设置session对象是为了服务器端识别客户，由于HTTP协议是无连接的，客户浏览器与服务器建立连接，发出请求，得到响应。一旦发送响应，Web服务器就会忘记你是谁。下一次再做请求时，Web服务器不会认识你。换句话说，它们不记得你曾经做过请求，也不记得它们曾经给你发出过响应，什么都不记得。有时这样做没什么，但有些时候可能需要跨多个请求保留与客户的会话状态。

**Session的常用方法**
|方法名称|说明|
|--|--|
|setAttribute(String attName,Objectvalue)|设定指定名字属性值，并把它存储在session对象中|
|getAttribute(String attName)|获取指定名字属性值，若属性不存在，返回null|
|removeAttribute(String attName)|删除指定属性|
|setManInactiveInterval(int interval)|设置session有效时间，单位为秒|
|getManInactiveInterval(）|获取session对象生存时间，单位为秒|
|invalidate()|销毁session,并释放所有与之相关联的对象。要牢记会话与用户相关联，而不是单个Servlet或JSP页面|
|getId()|返回当前session的ID|
|isNew()|判断当前用户是否为新用户，可以判断用户是否刷新了当前页面。如果没有响应，则返回true|

**session购物例子：**

```
 /*example.jsp*/
  <html>
  <body>
    欢迎访问，请输入姓名：
   <form>
   		<input type="text" name="name">
   		<input type="submit" name="submit" value="提交">
   </form>
   <%
   		String name = request.getParameter("name");
   		if(name==null)
   		{
   			name="";
   		}
   		else
   		{
   			byte b[]=name.getBytes("UTF-8");
   			name=new String(b);
   			session.setAttribute("customerName", name);
   		}
    %>
    <%
    	if(name.length()>0)
    	{
    		%>
    		<a href="book.jsp">欢迎去选书！</a>
    		<% 
    	}
     %>
  </body>
  <font></font>
</html>
```

```
/*book.jsp*/
<html>
 <body>
    <A href="example.jsp">修改姓名!</A>
    <p>
  	  请选择您要购买的书：
  	  	<form>
  	  		<input type="checkbox" name="item" value="Java">Java
  	  		<input type="checkbox" name="item" value="JSP">JSP
  	  		<input type="checkbox" name="item" value="Structs">Structs
  	  		<p>
  	  		<input type="submit" name="submit" value="提交">
  	  	</form>
  	  	<%
  	  		String book[]=request.getParameterValues("item");
  	  		if(book!=null)
  	  		{
  	  			for(int k=0;k<book.length;k++)
  	  			{
  	  				session.setAttribute(book[k], book[k]);	
  	  			}
  	  		}
  	  	 %>
  	  	 <a href="count.jsp">去结账！</a>
  </body>
</html>
```

```
/*count.jsp*/
<html>
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
```
![这里写图片描述](http://img.blog.csdn.net/20150514205536332)

![这里写图片描述](http://img.blog.csdn.net/20150514205549499)
![这里写图片描述](http://img.blog.csdn.net/20150514205557377)

### 在文件夹里还包括了一个网站计数器的示例代码 ###

###4、Application对象###
对于一个容器而言，每个用户共同使用一个application对象，这和session对象是不一样的，它用于实现用户间数据共享。服务器启动后，自动创建application对象，这个对象一直会保持，直到服务器关闭为止。
**application对象常用方法**
|方法名称|说明|
|--|--|
|setAttribute(String attName,Object value)|设置指定名字属性值|
|getAttributr(String attName)|获取指定名字属性值|
|Enumeration getAttributeNames()|返回所有application对象的属性名字|
|removeAttribute(String attName)|删除指定属性|
|String getRealPath(String path)|返回虚拟路径的真实路径|
提交并查看留言板的例子：
**application.jsp:**
```
<html>
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
```
**messagePane.jsp:**

```
<html>
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
```
**showMessage.jsp:**

```
<html>
  <body>
    <%Vector v=(Vector)application.getAttribute("Mess");
    	for(int i=0;i<v.size();i++)
    	{
    		String message=(String)v.elementAt(i);
    		StringTokenizer fenxi=new StringTokenizer(message,"# ");
    		while(fenxi.hasMoreTokens())
    		{
    			String str=fenxi.nextToken();
    			out.print("<br>"+str);
    		}
    	}
     %>
  </body>
</html>
```
![这里写图片描述](http://img.blog.csdn.net/20150515221946828)

![这里写图片描述](http://img.blog.csdn.net/20150515221908542)

![这里写图片描述](http://img.blog.csdn.net/20150515221918542)