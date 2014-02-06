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
		联系我们
	</h2>
	<p class="reg">
		<a href="contact/contact_us.jsp"><span>I</span>联系信息</a>
	</p>
	<p class="reg">
		<a href="contact/e_map.jsp"><span>M</span>电子地图</a>
	</p>
	<!--  
	<p class="reg">
		<a href="contact/query_us.jsp"><span>MSG</span>留言查询</a>
	</p>
	-->
	<jsp:include page="../common/left_menu.jsp" flush="true" />
	<br class="spacer" />
</div>