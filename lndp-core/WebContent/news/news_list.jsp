<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.lndp.model.*" %>
<%@ page import="com.lndp.constant.NewsConst" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="新闻中心-新闻列表"/>
		<base href="<%=basePath%>" />
		<title>新闻中心-新闻列表</title>
		
	 	<link href="resource/style/frontend/css/innerstyle.css"
			rel="stylesheet" type="text/css" />

		<link href="style/header.css" rel="stylesheet" type="text/css" />
		<link href="style/main.css" rel="stylesheet" type="text/css" />
		<link href="style/index.css" rel="stylesheet" type="text/css" />
		<link href="style/footer.css" rel="stylesheet" type="text/css" />

		
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/easySlider1.5.js"></script>
		<script type="text/javascript">
		// <![CDATA[
		$(document).ready(function(){	
			$("#slider").easySlider({
				controlsBefore:	'<p id="controls">',
				controlsAfter:	'</p>',
				auto: true, 
				continuous: true
			});	
		});
		// ]]>
		</script>
			
	</head>
	<body>
		<jsp:include page="../common/header.jsp" flush="true" />

		<%
			String newsType = (String)request.getAttribute("newsType");
			String viewType = "";
			if(NewsConst.NEWS_TYPE_PROPERTY_LEASING.equalsIgnoreCase(newsType)){
				viewType = NewsConst.NEWS_VIEW_PROPERTY_LEASING_CENTER;
			} else if(NewsConst.NEWS_TYPE_PLAZA.equalsIgnoreCase(newsType) || NewsConst.NEWS_TYPE_NOTICE.equalsIgnoreCase(newsType)){
				viewType = NewsConst.NEWS_VIEW_NEWS_CENTER;
			} else if(NewsConst.NEWS_TYPE_RECRUITMENT.equalsIgnoreCase(newsType)){
				viewType = NewsConst.NEWS_VIEW_RECRUITMENT_CENTER;
			} 
		%>
		
		<!--bot start  -->
		<div id="bot">
			<!--left start -->
			<!--left end -->
			<!--mid start -->
			<jsp:include page="news_menu.jsp" flush="true"/>
			<!--mid end -->
			<!--right start -->
			<div id="right" >
				<s:if test="#request.newsType == @com.lndp.constant.NewsConst@NEWS_TYPE_PROPERTY_LEASING">
					<div class="contentCT">
						物业租赁
					</div>
				</s:if>
				<s:elseif test="#request.newsType == @com.lndp.constant.NewsConst@NEWS_TYPE_PLAZA">
					<div class="contentCT">
						广场新闻
					</div>
				</s:elseif>
				<s:elseif test="#request.newsType == @com.lndp.constant.NewsConst@NEWS_TYPE_NOTICE">
					<div class="contentCT">
						通知通告
					</div>
				</s:elseif>
				<s:elseif test="#request.newsType == @com.lndp.constant.NewsConst@NEWS_TYPE_RECRUITMENT">
					<div class="contentCT">
						人才招聘
					</div>
				</s:elseif>
				<s:elseif test="#request.newsType == @com.lndp.constant.NewsConst@NEWS_TYPE_INDUSTRY_TREND">
					<div class="contentCT">
						行业动态
					</div>
				</s:elseif>

				<!-- content start -->
				<div class="newsContainer">
					<ul>
						<s:iterator value="pageBean.list" status="status">
							<li>
								<a href="news_findById.action?viewType=${viewType}&newsId=<s:property value="newsId"/>" />-
									
									<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_LONG_LONG" />
									<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
									<s:property value="@com.lndp.utils.SubStringUtil@splitString(newsTitle , #subStringLen , #subStringElide)" />
								</a>
								<s:set name="isLatestDateGap" value="@com.lndp.constant.CommonConst@IS_LATEST_DATE_GAP" />
								<s:if test="@com.lndp.utils.DatetimeUtil@isLatest(updatedTime , #isLatestDateGap)">
									<img src="images/new.gif" width="22" height="9" />
								</s:if>
								<div><s:date name="updatedTime" format="yyyy-MM-dd hh:mm"/></div>
							</li>
						</s:iterator>
					</ul>
				</div>
				<!-- content end -->

				<div class="pager" >
					<form id="page_form" action="news_findForPageByType.action" method="post">
						<s:if test="%{pageBean.currentPage == 1}">第一页</s:if>
						<s:else>
							<a href="news_findForPageByType.action?viewType=${viewType}&newsType=<s:property value="#request.newsType"/>&targetPage=<s:property value="%{pageBean.currentPage - 1}"/>">
								<img src="resource/style/backend/img/icons/arrow_left.gif" width="16" height="16"/> 
							</a>
						</s:else>
						
						<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
							<a href="news_findForPageByType.action?viewType=${viewType}&newsType=<s:property value="#request.newsType"/>&targetPage=<s:property value="%{pageBean.currentPage + 1}"/>">
								<img src="resource/style/backend/img/icons/arrow_right.gif" width="16" height="16" />
							</a>
						</s:if>
						<s:else>最后一页</s:else>
						
						<input type="hidden" name="viewType" value="${viewType}"></input>
						<input type="hidden" name="newsType" value="<s:property value="#request.newsType" />"></input>
						跳转到第
						<input type="text" name="targetPage" id="targetPage" size="2" value="<s:property value="pageBean.currentPage"/>"  />
						页
						<input type="submit" name="submit" class="submitbutton2" value="查询"/>
						<br/>
						<br/>
						当前第【  <s:property value="pageBean.currentPage"/> 】页
						总共【 <s:property value="pageBean.totalPage"/> 】页 | 每页
						<select name="pageSize">
							<s:if test="#request.pageSize != null && #request.pageSize != 0">
								<s:if test="#request.pageSize == 5">
								<option selected="selected">5</option>
								</s:if>
								<s:else><option>5</option></s:else>
								<s:if test="#request.pageSize == 10">
									<option selected="selected">10</option>
								</s:if>
								<s:else><option>10</option></s:else>
								<s:if test="#request.pageSize == 30">
									<option selected="selected">30</option>
								</s:if>
								<s:else><option>30</option></s:else>
								<s:if test="#request.pageSize == 50">
									<option selected="selected">50</option>
								</s:if>
								<s:else><option>50</option></s:else>
							</s:if>
							<s:else>
								<s:if test="@com.lndp.constant.NewsConst@NEWS_PAGE_SIZE == 5">
								<option selected="selected">5</option>
								</s:if>
								<s:else><option>5</option></s:else>
								<s:if test="@com.lndp.constant.NewsConst@NEWS_PAGE_SIZE == 10">
									<option selected="selected">10</option>
								</s:if>
								<s:else><option>10</option></s:else>
								<s:if test="@com.lndp.constant.NewsConst@NEWS_PAGE_SIZE == 30">
									<option selected="selected">30</option>
								</s:if>
								<s:else><option>30</option></s:else>
								<s:if test="@com.lndp.constant.NewsConst@NEWS_PAGE_SIZE == 50">
									<option selected="selected">50</option>
								</s:if>
								<s:else><option>50</option></s:else>
							</s:else>
						</select>
						条记录 | 一共【
						<strong><s:property value="pageBean.allRow"/></strong> 】条记录
					</form>
				</div>
			</div>
			<!--right end -->
			<br class="spacer" />
		</div>
		<!--bot end  -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
	</body>
</html>