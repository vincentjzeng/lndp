<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.lndp.constant.NewsConst" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="信新闻息-展示"/>
		<title>信新闻息-展示</title>
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
						<h3 id="newsMgr">
							信息管理
						</h3>
						<form id="form" action="news_admin_.action" method="post">
							<s:set name="leasing" value="1"/>
							<s:set name="plaza" value="2"/>
							<s:set name="notice" value="3"/>
							<s:set name="recruitment" value="4"/>
							<s:set name="industryTrend" value="5"/>
							<fieldset id="personal">
								<legend>
									信息查询
								</legend>
								<ul>
									<li>
										信息类型 :   
										<s:if test="#request.news.newsType == #leasing">
											物业租赁
										</s:if>
										<s:elseif test="#request.news.newsType == #plaza">
											广场新闻
										</s:elseif>
										<s:elseif test="#request.news.newsType == #notice">
											通知
										</s:elseif>
										<s:elseif test="#request.news.newsType == #recruitment">
											人才招聘
										</s:elseif>
										<s:elseif test="#request.news.newsType == #industryTrend">
											行业动态
										</s:elseif>
										<s:else>
											未知的类型
										</s:else>
									</li>
									<li>
										信息标题 : 
										<s:property value="#request.news.newsTitle" />
									</li>
									<li>
										<div id="newContent">
											<s:property value="#request.news.newsContent" escape="false"/>
										</div>
									</li>
									<li>
										更新用户 : 
										<s:property value="#request.news.updatedUser" />
									</li>
									<li>
										更新时间 : 
										<s:date name="#request.news.updatedTime" format="yyyy-MM-dd HH:mm"/>
									</li>
								</ul>
							</fieldset>
							
							<br/>
							<input type="hidden" name="newsId" value="<s:property value="#request.news.newsId" />"/>
							<input type="hidden" name="action" value="update"/>
							<div align="right">
								<input id="back" type="button" value="后退" onclick="javascript:window.history.back();" />
								<s:submit name="update" value="更新" method="findById" ></s:submit>
								<s:submit name="delete" value="删除" method="delete" ></s:submit>
							</div>
						</form>

					</div>
				</div>
				<jsp:include page="/admin/common/sidebar.jsp" flush="true" />
			</div>
			<jsp:include page="/admin/common/footer.jsp" flush="true" />
		</div>
	</body>
</html>

