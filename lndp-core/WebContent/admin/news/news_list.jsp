<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="信新闻息-列表"/>
		<title>信新闻息-列表</title>
		<link rel="stylesheet" type="text/css"
			href="resource/style/backend/css/theme.css" />
		<link rel="stylesheet" type="text/css"
			href="resource/style/backend/css/style.css" />
		<script>
			var StyleFile = "theme" + document.cookie.charAt(6) + ".css";
			document.writeln('<link rel="stylesheet" type="text/css" href="resource/style/backend/css/' + StyleFile + '">');
		</script>
		<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="resource/style/backend/css/ie-sucks.css" />
		<![endif]-->
	</head>

	<body>	
		<jsp:include page="/admin/login_check.jsp" flush="true" />

		<div id="container">
			<jsp:include page="/admin/common/header_news.jsp" flush="true" />
			<div id="wrapper">
				<div id="content">
					<div id="box">
						<h3>
							信息列表
						</h3>
						<form id="form" action="news_admin_findByType.action" method="post">
							信息类型 ： 
							<select name="newsType">
								<s:if test="#request.newsType == 1">
									<option selected="selected" label="物业租赁" value="1">
										物业租赁
									</option>
								</s:if>
								<s:else>
									<option label="物业租赁" value="1">
										物业租赁
									</option>
								</s:else>
								<s:if test="#request.newsType == 2">
									<option selected="selected" label="广场新闻" value="2">
										广场新闻
									</option>
								</s:if>
								<s:else>
									<option label="广场新闻" value="2">
										广场新闻
									</option>
								</s:else>
								<s:if test="#request.newsType == 3">
									<option selected="selected" label="通知" value="3">
										通知
									</option>
								</s:if>
								<s:else>
									<option label="通知" value="3">
										通知
									</option>
								</s:else>
								<s:if test="#request.newsType == 4">
									<option selected="selected" label="人才招聘" value="4">
										人才招聘
									</option>
								</s:if>
								<s:else>
									<option label="人才招聘" value="4">
										人才招聘
									</option>
								</s:else>
								<s:if test="#request.newsType == 5">
									<option selected="selected" label="行业动态" value="5">
										行业动态
									</option>
								</s:if>
								<s:else>
									<option label="行业动态" value="5">
										行业动态
									</option>
								</s:else>
								<s:if test="#request.newsType == 0 || #request.newsType == null">
									<option selected="selected" label="全部" value="0">
										全部
									</option>
								</s:if>
								<s:else>
									<option label="全部" value="0">
										全部
									</option>
								</s:else>
							</select>
							<input id="button1" type="submit" value="查询"/>
						</form>
						<div id="newsList">
							<display:table name="newsList" pagesize="10" requestURI="news_admin_findAll.action" decorator="com.lndp.displaytag.decorator.NewsListDecorator">
								<display:column property="newsTitle" title="信息标题" sortable="true" href="news_admin_findById.action?action=view" paramId="newsId" paramProperty="newsId" />
								<display:column property="newsType" title="信息类型" sortable="true" />
								<display:column property="updatedUser" title="更新用户" sortable="true" />
								<display:column property="updatedTime" title="更新时间" sortable="true" />
								<display:column property="operation" title="操作"  />
							</display:table>
						</div>
					</div>
				</div>
				<jsp:include page="/admin/common/sidebar.jsp" flush="true" />
			</div>
			<jsp:include page="/admin/common/footer.jsp" flush="true" />
		</div>
	</body>
</html>

