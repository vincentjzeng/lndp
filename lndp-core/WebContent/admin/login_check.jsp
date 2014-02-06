<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="#session.userinfo == null">
	<script language="javascript" type="text/javascript">
		window.location.href="<%=basePath%>admin/admin_login.jsp?backurl=" + window.location.href;
	</script>
</s:if>