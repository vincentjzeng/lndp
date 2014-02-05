<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>File Upload Example</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="File Upload Example">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		File Upload Example
		<br>
		<s:fielderror name="file"/> 

		<s:form action="file_upload" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						Choose File:：
						<s:file name="file"></s:file>
					</td>
				</tr>
				<tr>
					<td>
						More files：
						<s:file name="file"></s:file>
					</td>
				</tr>
				<s:submit value="Submit" name="submit" />
			</table>
		</s:form>

		<div>
			<s:iterator value="#request.fileFileName" status="status">
				<s:if test="#status.odd == true">
					<li>
						White
						<img src='upload/<s:property />'  height="500" width"800"/>
						<br />
						File Name:  <s:property />
					</li>
				</s:if>
				<s:else>
					<li>
						Blue
						<img src='upload/<s:property />' height="500" width"800"/>
						<br />
						File Name: <s:property />
					</li>
				</s:else>
			</s:iterator>
		</div>

	</body>
</html>
