<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<div id="mid">
	<h2>
		商家名录
	</h2>
	<p class="reg">
		<a href="company_findForPage.action"><span>C</span>商家目录</a>
	</p>
	<jsp:include page="../common/left_menu.jsp" flush="true" />
	<br class="spacer" />
</div>