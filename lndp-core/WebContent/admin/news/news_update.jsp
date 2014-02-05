<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.lndp.constant.NewsConst" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<meta http-equiv="description" content="信新闻息-更新"/>
		<title>信新闻息-更新</title>
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
			<div id="header">
				<jsp:include page="/admin/common/header_news.jsp" flush="true" />
				<div id="wrapper">
					<div id="content">
						<div id="box">
							<h3 id="adduser">
							信息管理
						</h3>
						<form id="form" action="news_admin_update.action" method="post">
							<fieldset id="personal">
								<legend>
									信息发布
								</legend>
								<ul>
									<li>注意： 标注为 <strong> * </strong> 的项目为必填项</li>
									<li>
										<strong> * </strong> 信息类型 : 
										<s:set name="leasing" value="1"/>
										<s:set name="plaza" value="2"/>
										<s:set name="notice" value="3"/>
										<s:set name="recruitment" value="4"/>
										<s:set name="industryTrend" value="5"/>
										<s:if test="#request.news != null">
											<select name="newsType" tabindex="1">
												<s:if test="#request.news.newsType == #leasing">
													<option selected="selected" label="物业租赁"
														value="<%=NewsConst.NEWS_TYPE_PROPERTY_LEASING%>">物 业租赁</option>
												</s:if>
												<s:else>
													<option label="物业租赁"
														value="<%=NewsConst.NEWS_TYPE_PROPERTY_LEASING%>">物 业租赁</option>
												</s:else>
												<s:if test="#request.news.newsType == #plaza">
													<option selected="selected" label="广场新闻"
														value="<%=NewsConst.NEWS_TYPE_PLAZA%>">广 场新闻</option>
												</s:if>
												<s:else>
													<option label="广场新闻" value="<%=NewsConst.NEWS_TYPE_PLAZA%>">
													广 场新闻</option>
												</s:else>
												<s:if test="#request.news.newsType == #notice">
													<option selected="selected" label="通知"
														value="<%=NewsConst.NEWS_TYPE_NOTICE%>">通 知</option>
												</s:if>
												<s:else>
													<option label="通知" value="<%=NewsConst.NEWS_TYPE_NOTICE%>">
													通 知</option>
												</s:else>
												<s:if test="#request.news.newsType == #recruitment">
													<option selected="selected" label="人才招聘"
														value="<%=NewsConst.NEWS_TYPE_RECRUITMENT%>">人 才招聘</option>
												</s:if>
												<s:else>
													<option label="人才招聘" value="<%=NewsConst.NEWS_TYPE_RECRUITMENT%>">
													人 才招聘</option>
												</s:else>
												<s:if test="#request.news.newsType == #industryTrend">
													<option selected="selected" label="行业动态"
														value="<%=NewsConst.NEWS_TYPE_INDUSTRY_TREND%>">行业动态</option>
												</s:if>
												<s:else>
													<option label="行业动态" value="<%=NewsConst.NEWS_TYPE_INDUSTRY_TREND%>">
													行业动态</option>
												</s:else>
											</select>
										</s:if> 
										<s:else>
											<select name="newsType" tabindex="1">
												<s:if test="#request.newsType == #leasing">
													<option selected="selected" label="物业租赁"
														value="<%=NewsConst.NEWS_TYPE_PROPERTY_LEASING%>">物 业租赁</option>
												</s:if>
												<s:else>
													<option label="物业租赁"
														value="<%=NewsConst.NEWS_TYPE_PROPERTY_LEASING%>">物 业租赁</option>
												</s:else>
												<s:if test="#request.newsType == #plaza">
													<option selected="selected" label="广场新闻"
														value="<%=NewsConst.NEWS_TYPE_PLAZA%>">广 场新闻</option>
												</s:if>
												<s:else>
													<option label="广场新闻" value="<%=NewsConst.NEWS_TYPE_PLAZA%>">
													广 场新闻</option>
												</s:else>
												<s:if test="#request.newsType == #notice">
													<option selected="selected" label="通知"
														value="<%=NewsConst.NEWS_TYPE_NOTICE%>">通 知</option>
												</s:if>
												<s:else>
													<option label="通知" value="<%=NewsConst.NEWS_TYPE_NOTICE%>">
													通 知</option>
												</s:else>
												<s:if test="#request.newsType == #recruitment">
													<option selected="selected" label="人才招聘"
														value="<%=NewsConst.NEWS_TYPE_RECRUITMENT%>">人 才招聘</option>
												</s:if>
												<s:else>
													<option label="人才招聘" value="<%=NewsConst.NEWS_TYPE_RECRUITMENT%>">
													人 才招聘</option>
												</s:else>
												<s:if test="#request.newsType == #industryTrend">
													<option selected="selected" label="行业动态"
														value="<%=NewsConst.NEWS_TYPE_INDUSTRY_TREND%>">行业动态</option>
												</s:if>
												<s:else>
													<option label="行业动态" value="<%=NewsConst.NEWS_TYPE_INDUSTRY_TREND%>">
													行业动态</option>
												</s:else>
											</select>
										</s:else>							
									</li>
									<s:fielderror ><s:param>newsType</s:param></s:fielderror>
									<li>
										<strong> * </strong> 信息标题 : 
										<s:if test="#request.news != null">
											<input name="newsTitle" id="newsTitle" type="text" 
												value="<s:property value="#request.news.newsTitle"/>" size="50" maxlength="50" tabindex="2" />
										</s:if>
										<s:else>
											<input name="newsTitle" id="newsTitle" type="text" 
												value="<s:property value="#request.newsTitle"/>" size="50" maxlength="50" tabindex="2" />
										</s:else>
									</li>
									<s:fielderror ><s:param>newsTitle</s:param></s:fielderror>
									<li>
										更新用户 : 
										<s:if test="#request.news != null">
											<s:property value="#request.news.updatedUser" />
										</s:if>
										<s:else>
											<s:property value="#request.updatedUser" />
										</s:else>
									</li>
									<li>
										更新时间 :  
										<s:if test="#request.news != null">
											<s:date name="#request.news.updatedTime" format="yyyy-MM-dd HH:mm"/>
										</s:if>
										<s:else>
											<s:date name="#request.updatedTime" format="yyyy-MM-dd HH:mm"/>
										</s:else>
									</li>								
									<li>
										<div id="fckEditor">
											<FCK:editor instanceName="newsContent">
												<jsp:attribute name="basePath">/fckeditor</jsp:attribute>
												<jsp:attribute name="width">100%</jsp:attribute>
												<jsp:attribute name="height">800</jsp:attribute>
												<jsp:attribute name="value">
												<s:if test="#request.news != null">
													<s:property value="#request.news.newsContent" escape="false"/>
												</s:if>
												<s:else>
													<s:property value="#request.newsContent" escape="false"/>
												</s:else>
												</jsp:attribute>
											</FCK:editor>
										</div>
									</li>
									<s:fielderror ><s:param>newsContent</s:param></s:fielderror>
								</ul>
							</fieldset>
							<div align="center">
								<input id="newsId" name="newsId" type="hidden" value="<s:property value="#request.news.newsId"/>" />
								<input id="update" type="submit" value="更新" />
								<input id="delete" type="reset" value="重置"/>
								<input id="back" type="button" value="后退" onclick="javascript:window.history.back();"/>
							</div>
						</form>


						</div>
					</div>
					<jsp:include page="/admin/common/sidebar.jsp" flush="true" />
				</div>
				<jsp:include page="/admin/common/footer.jsp" flush="true" />
			</div>
		</div>
	</body>
</html>

