<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lndp.model.*" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
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
		<meta http-equiv="description" content="新闻中心-新闻索引"/>
		<base href="<%=basePath%>" />
		<title>新闻中心-新闻索引</title>
		 
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
		<!--bot start  -->
		<div id="bot">
			<!--left start -->
			<!--left end -->
			<!--mid start -->
			<jsp:include page="news_menu.jsp" flush="true"/>
			<!--mid end -->
			<!--right start -->
			<div id="right">
				<s:if test="#request.viewType == @com.lndp.constant.NewsConst@NEWS_VIEW_PROPERTY_LEASING_CENTER">
					<!--leasing start -->
					<div class="contentCT">物业租赁
						<a href="news_findForPageByType.action?viewType=<s:property 
								value="@com.lndp.constant.NewsConst@NEWS_VIEW_PROPERTY_LEASING_CENTER"/>&newsType=<s:property 
								value="@com.lndp.constant.NewsConst@NEWS_TYPE_PROPERTY_LEASING"/>">
							<img src="images/more1.gif" width="45" height="11" />
						</a>
					</div>
					<div class="newsContainer">
						<img src="images/index_07.gif" width="146" height="128" />
						<ul>
							<s:iterator value="#request.leasingList" status="status">
								<li>
									<a href="news_findById.action?viewType=<s:property 
									value="@com.lndp.constant.NewsConst@NEWS_VIEW_PROPERTY_LEASING_CENTER"/>&newsId=<s:property 
									value="newsId"/>" />-
										
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
					<!--leasing trend end -->
					
				</s:if>
				<s:elseif test="#request.viewType == @com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER">
					
					<!--plaza news start -->
					<div class="contentCT">广场新闻
						<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_PLAZA"/>">
							<img src="images/more1.gif" width="45" height="11" />
						</a>
					</div>
					<div class="newsContainer">
						<img src="images/index_07.gif" width="146" height="128" />
						<ul>
							<s:iterator value="#request.plazaList" status="status">
								<li>
									<a href="news_findById.action?viewType=<s:property 
									value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsId=<s:property 
									value="newsId"/>" >
										<s:property value="#status.count"/>. 
										
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
					<!--plaza news end -->

					<!--notice start -->
					<div class="contentCT">通知通告
						<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_NOTICE"/>">
							<img src="images/more1.gif" width="45" height="11" />
						</a>
					</div>
					<div class="newsContainer">
						<img src="images/index_07.gif" width="146" height="128" />
						<ul>
							<s:iterator value="#request.noticeList" status="status">
								<li>
									<a href="news_findById.action?viewType=<s:property 
									value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsId=<s:property 
									value="newsId"/>" />. 
										
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
					<!--notice end -->

					<!--industry trend start -->
					<div class="contentCT">行业动态
						<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_INDUSTRY_TREND"/>">
							<img src="images/more1.gif" width="45" height="11" />
						</a>
					</div>
					<div class="newsContainer">
						<img src="images/index_07.gif" width="146" height="128" />
						<ul>
							<s:iterator value="#request.industTrendList" status="status">
								<li>
									<a href="news_findById.action?viewType=<s:property 
									value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsId=<s:property 
									value="newsId"/>" />. 
										
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
					<!--industry trend end -->
				</s:elseif>
				<s:elseif test="#request.viewType == @com.lndp.constant.NewsConst@NEWS_VIEW_RECRUITMENT_CENTER">
					<!--recruitment start -->
					<div class="contentCT">人才招聘
						<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_RECRUITMENT_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_RECRUITMENT"/>">
							<img src="images/more1.gif" width="45" height="11" />
						</a>
					</div>
					<div class="newsContainer">
						<img src="images/index_07.gif" width="146" height="128" />
						<ul>
							<s:iterator value="#request.recruitmentList" status="status">
								<li>
									<a href="news_findById.action?viewType=<s:property 
									value="@com.lndp.constant.NewsConst@NEWS_VIEW_RECRUITMENT_CENTER"/>&newsId=<s:property 
									value="newsId"/>" />. 
										
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
					<!--recruitment trend end -->
					</ul>
				</s:elseif>
			</div>
			<!--right end -->
			<br class="spacer" />
		</div>
		<!--bot end  -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
	</body>
</html>