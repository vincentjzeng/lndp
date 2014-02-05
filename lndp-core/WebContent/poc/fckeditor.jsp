<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'fckeditor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="fckeditor/fckeditor.js"></script>

  </head>
  
  <body>
    FCK Editor PoC. <br>
    	<!-- 
	    <div id="js_fck">
			<form action="fckeditor.action">
				<script type="text/javascript">
					var fckeditor = new FCKeditor('fckeditor');
					fckeditor.BasePath = "fckeditor/";
					fckeditor.Width = '70%';
					fckeditor.Height = '200';
					fckeditor.Value = 'editor content';
					fckeditor.Config["DefaultLanguage"]="zh-cn";
					fckeditor.Create();
				</script>
				<input type="submit" name="submit" value="Submit"/>
			</form>
		</div>
		 -->
		<div id="java_fck">
			<form action="fckeditor.action">
				<FCK:editor instanceName="fckeditor">
					<jsp:attribute name="basePath">/fckeditor</jsp:attribute>
					<jsp:attribute name="width">70%</jsp:attribute>
					<jsp:attribute name="height">600</jsp:attribute>
					<jsp:attribute name="value"><s:property value="fckeditor" escape="false"/></jsp:attribute>
				</FCK:editor>
				<input type="submit" name="submit" value="Submit"/>
			</form>
		</div>
	</body>
</html>
