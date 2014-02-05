<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>Login Page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css" media="all">  
	     @import url("${pageContext.request.contextPath}/resource/style/displaytag/css/maven-base.css");
	     @import url("${pageContext.request.contextPath}/resource/style/displaytag/css/maven-theme.css");
	     @import url("${pageContext.request.contextPath}/resource/style/displaytag/css/site.css");
	     @import url("${pageContext.request.contextPath}/resource/style/displaytag/css/screen.css");
	     @import url("${pageContext.request.contextPath}/resource/style/displaytag/css/alternative.css");
	     @import url("${pageContext.request.contextPath}/resource/style/displaytag/css/print.css");
	 </style> 

	</head>

	<body>

		<h1><s:property value="message" /> </h1>

		<div>
			<form action="user_login.action" method="post">
				<ul>
					<li>
						User Name : <input type="text" name="username"><s:fielderror name="username"/> 
					</li>
					<li>
						Password : <input type="password" name="password"><s:fielderror name="password"/> 
					</li>
					<li>
						<input type="submit" value="submit">
					</li>
				</ul>
				

				
			</form>
		</div>
		
		<p>
			Add user
		</p>
		<div>
			<form action="user_add.action" method="post">
				<ul>
					<li>
						User Name : <input type="text" name="username"><s:fielderror name="username"/> 
					</li>
					<li>
						Password : <input type="password" name="password"><s:fielderror name="password"/> 
					</li>
					<li>
						User Type : 
						<select name="userType">
							<option value="ADMIN">Admin</option>
							<option value="NORMAL">Normal</option>
						</select>
					</li>
					<li>
						<input type="submit" value="submit">
					</li>
				</ul>
				
			</form>
		</div>
		
		<p>
			Find All users
		</p>
		<div>
			<form action="user_findAll.action" method="post">
				<ul>
					<li>
						<input type="submit" value="submit">
					</li>
				</ul>
				
			</form>
		</div>
		
		<div>
			<s:iterator value="%{#request.userinfoList}" status="status">
				<s:if test="#status.odd == true">
					White
					<ul>
						<li>
							User ID : <s:property value="userId"/>
						</li>
						<li>
							User Name : <s:property value="username"/>
						</li>
						<li>
							User Password : <s:property value="password"/>
						</li>
						<li>
							User Type : <s:property value="userType"/>
						</li>
					</ul>					
				</s:if>
				<s:else>
					Blue
					<ul>
						<li>
							User ID : <s:property value="userId"/>
						</li>
						<li>
							User Name : <s:property value="username"/>
						</li>
						<li>
							User Password : <s:property value="password"/>
						</li>
						<li>
							User Type : <s:property value="userType"/>
						</li>
					</ul>				
				</s:else>
			</s:iterator>
		</div>
		
		<div id="displaytag_example">
			<display:table name="userinfoList" pagesize="2">
			  <display:column property="userId" title="ID" />
			  <display:column property="username" />
			  <display:column property="password" />
			  <display:column property="userType" />
			</display:table>
		</div>

	</body>
</html>
