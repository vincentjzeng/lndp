<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<base href="<%=basePath%>" />

<div id="sidebar">
	<ul>
		<li>
			<h3>
				<a href="company_admin_findAll.action" class="folder_table">商家管理</a>
			</h3>
			<ul>
				<li>
					<a href="company_admin_findAll.action" class="invoices">商家列表</a>
				</li>
				<li>
					<a href="admin/company/company_add.jsp" class="addorder">添加商家</a>
				</li>
				<!--
				<li>
					<a href="javascript:void(0);" class="search">查找商家</a>
				</li>
				-->
			</ul>
		</li>
		<li>
			<h3>
				<a href="news_admin_findAll.action" class="manage">信息管理</a>
			</h3>
			<ul>
				<li>
					<a href="news_admin_findAll.action" class="invoices">信息列表</a>
				</li>
				<li>
					<a href="admin/news/news_add.jsp" class="addorder">添加信息</a>
				</li>
				<!--
				<li>
					<a href="javascript:void(0);" class="search">查找信息</a>
				</li>
				-->
			</ul>
		</li>
		<!--  
		<li>
			<h3>
				<a href="javascript:void(0);" class="user">用户管理</a>
			</h3>
			<ul>
				<li>
					<a href="javascript:void(0);" class="invoices">用户列表</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="addorder">用户信息</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="search">查找用户</a>
				</li>
			</ul>
		</li>
		-->
		<li>
			<h3>
				<a href="javascript:void(0);" class="user">安全管理</a>
			</h3>
			<ul>
				<li>
					<a href="securityMgr_logout.action" class="invoices">退出</a>
				</li>
			</ul>
		</li>
	</ul>
</div>