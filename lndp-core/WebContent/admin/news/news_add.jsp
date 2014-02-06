<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.lndp.constant.NewsConst" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>


<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="信新闻息-添加"/>
		<title>信新闻息-添加</title>
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
						<h3 id="adduser">
							信息管理
						</h3>
						<form id="form" action="news_admin_add.action" method="post">
							<fieldset id="info_pub">
								<legend>
									信息发布
								</legend>
								<ul>
									<li>注意： 标注为 <strong> * </strong> 的项目为必填项</li>
									<li>
										<strong> * </strong> 信息类型 :   
										<select name="newsType" tabindex="1">
											<option selected="selected" label="物业租赁" value="<%=NewsConst.NEWS_TYPE_PROPERTY_LEASING%>">
												物业租赁
											</option>
											<option label="广场新闻" value="<%=NewsConst.NEWS_TYPE_PLAZA%>">
												广场新闻
											</option>
											<option label="通知" value="<%=NewsConst.NEWS_TYPE_NOTICE%>">
												通知
											</option>
											<option label="人才招聘" value="<%=NewsConst.NEWS_TYPE_RECRUITMENT%>">
												人才招聘
											</option>
											<option label="行业动态" value="<%=NewsConst.NEWS_TYPE_INDUSTRY_TREND%>">
												行业动态
											</option>
										</select>
									</li>
									<s:fielderror ><s:param>newsType</s:param></s:fielderror>
									<li>
										<strong> * </strong> 信息标题 : 
										<input name="newsTitle" id="newsTitle" type="text" 
											value="<s:property value="#request.newsTitle"/>" size="50" maxlength="50" tabindex="2" />
									</li>
									<s:fielderror ><s:param>newsTitle</s:param></s:fielderror>
									<li>
										<div id=newsContent>
											<FCK:editor instanceName="newsContent">
												<jsp:attribute name="basePath">/fckeditor</jsp:attribute>
												<jsp:attribute name="width">100%</jsp:attribute>
												<jsp:attribute name="height">800</jsp:attribute>
												<jsp:attribute name="value"><s:property value="#request.newsContent" escape="false"/></jsp:attribute>
											</FCK:editor>
										</div>
									</li>
									<s:fielderror ><s:param>newsContent</s:param></s:fielderror>
								</ul>
							</fieldset>
							<div align="center">
								<input id="button1" type="submit" value="添加" />
								<input id="button2" type="reset" value="重置"/>
								<input id="back" type="button" value="后退" onclick="javascript:window.history.back();"/>
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
