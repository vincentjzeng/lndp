<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<base href="<%=basePath%>" />

<div id="header">
	<h2>
		广州岭南国际电子数码广场电子商务平台后台管理系统
	</h2>
	<div id="topmenu">
		<div>
			<ul>
				<li class="current">
					<a href="company_admin_findAll.action">商家</a>
				</li>
				<li>
					<a href="news_admin_findAll.action">信息</a>
				</li>
				<!--
				<li>
					<a href="javascript:void(0);">用户</a>
				</li>
				-->
				<li>
					<a href="securityMgr_logout.action">退出</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="top-panel">
		<div id="panel">
			<ul>
				<li>
					<a href="company_admin_findAll.action" class="group">商家列表</a>
				</li>
				<li>
					<a href="admin/company/company_add.jsp" class="useradd">添加商家</a>
				</li>
				<!--
				<li>
					<a href="javascript:void(0);" class="search">查找商家</a>
				</li>
				-->
			</ul>
		</div>
	</div>
</div>