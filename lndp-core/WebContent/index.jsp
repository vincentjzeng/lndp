<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<%@ page import="com.lndp.constant.CommonConst" %>
<%@ page import="com.lndp.constant.EnvConst" %>
<%@ page import="com.lndp.constant.NewsConst" %>
<%@ page import="com.lndp.constant.CompanyConst" %>
<%@ page import="com.lndp.model.News" %>
<%@ page import="com.lndp.model.Company" %>
<%@ page import="com.lndp.model.PageBean" %>
<%@ page import="com.lndp.model.Contact" %>
<%@ page import="com.lndp.service.INewsService" %>
<%@ page import="com.lndp.service.NewsService" %>
<%@ page import="com.lndp.service.ICompanyService" %>
<%@ page import="com.lndp.service.CompanyService" %>
<%@ page import="com.lndp.utils.SubStringUtil" %>



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
	<meta http-equiv="keywords"
		content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘" />
	<meta http-equiv="description" content="主页" />
	<!-- google admin tool meta - http://jsplndigi.w20.cndns2.com/lndp-->
	<meta name="google-site-verification" content="0aNXxxDXnYMqiMKwSBx4xTsFS7DvN4OZ-BgyqiM8oq8" />
	<!-- google admin tool meta - http://www.lndigi.com/-->
	<meta name="google-site-verification" content="8KAsUDzNAcFr0lyynCqWN2Ng9N74yB91Tuh0ttHxMO0" />
	<!-- google admin tool meta - http://lndigi.com/-->
	<meta name="google-site-verification" content="8KAsUDzNAcFr0lyynCqWN2Ng9N74yB91Tuh0ttHxMO0" />
	<!-- yahoo tool meta - http://jsplndigi.w20.cndns2.com/lndp -->
	<META name="y_key" content="87775ae0013bebe3">
	<base href="<%=basePath%>" />
	<title>广州岭南国际电子数码广场-主页</title>

	<link href="style/header.css" rel="stylesheet" type="text/css" />
	<link href="style/main.css" rel="stylesheet" type="text/css" />
	<link href="style/index.css" rel="stylesheet" type="text/css" />	
	<link href="style/gallery.css" rel="stylesheet" type="text/css" />
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

<jsp:include page="common/header.jsp" flush="true" />

<%
	Logger logger = Logger.getLogger(this.getClass().getName());

	WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
	
	INewsService newsService = (INewsService) ctx.getBean("newsService");
	ICompanyService cmpService = (ICompanyService)ctx.getBean("companyService");
%>

<!--content strat-->
<div class="content">
	<div class="contentL">
		<div class="contentLT">
			
			<a href="news_findForPageByType.action?viewType=<s:property 
								value="@com.lndp.constant.NewsConst@NEWS_VIEW_PROPERTY_LEASING_CENTER"/>&newsType=<s:property 
								value="@com.lndp.constant.NewsConst@NEWS_TYPE_PROPERTY_LEASING"/>">
				<img src="images/more2.gif" width="45" height="11" />
			</a>
			物业租赁
		</div>
		<div class="contentLB">

		<%
		List<News> leasingList = newsService.findForIndexByType(NewsConst.NEWS_TYPE_PROPERTY_LEASING, CommonConst.HOME_NEWS_PROPERTY_LEASING_RECORD_COUNT);
		if(leasingList != null && leasingList.size() != 0){
			for(News news : leasingList){
				logger.info("News" + news + "] has been found.");
			}
			request.setAttribute("leasingList", leasingList);
		} else {
			logger.info("No news exist.");
		}
		%>
		<s:iterator value="#request.leasingList" status="status">
			<li>
				<a href="news_findById.action?viewType=<s:property 
								value="@com.lndp.constant.NewsConst@NEWS_VIEW_PROPERTY_LEASING_CENTER"/>&newsId=<s:property value="newsId"/>" >
					<s:property value="#status.count"/>-
					
					<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_SHORT" />
					<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
					<s:property value="@com.lndp.utils.SubStringUtil@splitString(newsTitle , #subStringLen , #subStringElide)" />
				</a>
				<s:set name="isLatestDateGap" value="@com.lndp.constant.CommonConst@IS_LATEST_DATE_GAP" />
				<s:if test="@com.lndp.utils.DatetimeUtil@isLatest(updatedTime , #isLatestDateGap)">
					<img src="images/new.gif" width="22" height="9" />
				</s:if>
			</li>
		</s:iterator>
		</div>
	</div>

	<div class="contentC">
		<div class="contentCT">广场新闻
			<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_PLAZA"/>">
				<img src="images/more1.gif" width="45" height="11" />
			</a>
		</div>

		<div class="contentCB">
			<img src="images/index_07.gif" width="146" height="128" />
			<ul>
				<%
				List<News> plazaList = newsService.findForIndexByType(NewsConst.NEWS_TYPE_PLAZA, CommonConst.HOME_NEWS_PLAZA_RECORD_COUNT);
				if(plazaList != null && plazaList.size() != 0){
					for(News news : plazaList){
						logger.info("News" + news + "] has been found.");
					}
					request.setAttribute("plazaList", plazaList);
				} else {
					logger.info("No news exist.");
				}
				%>
				<s:iterator value="#request.plazaList" status="status">
					<li>
						<a href="news_findById.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsId=<s:property value="newsId"/>">
							<s:property value="#status.count"/>-
							
							<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_MIDDLE" />
							<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
							<s:property value="@com.lndp.utils.SubStringUtil@splitString(newsTitle , #subStringLen , #subStringElide)" />
						</a>
						<s:set name="isLatestDateGap" value="@com.lndp.constant.CommonConst@IS_LATEST_DATE_GAP" />
						<s:if test="@com.lndp.utils.DatetimeUtil@isLatest(updatedTime , #isLatestDateGap)">
							<img src="images/new.gif" width="22" height="9" />
						</s:if>
						<div><s:date name="updatedTime" format="yyyy-MM-dd"/></div>
					</li>
				</s:iterator>
			</ul>
		</div>

		<div class="contentCT">
			行业动态
			<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_INDUSTRY_TREND"/>">
				<img src="images/more1.gif" width="45" height="11" />
			</a>
		</div>
		<div class="movement">
			<ul>
				<%
				List<News> industTrendList = newsService.findForIndexByType(NewsConst.NEWS_TYPE_INDUSTRY_TREND, CommonConst.HOME_NEWS_NDUSTRY_TREND_RECORD_COUNT);
				if(industTrendList != null && industTrendList.size() != 0){
					for(News news : industTrendList){
						logger.info("News" + news + "] has been found.");
					}
					request.setAttribute("industTrendList", industTrendList);
				} else {
					logger.info("No news exist.");
				}
				%>
				<s:iterator value="#request.industTrendList" status="status">
					<li>
						
						<a href="news_findById.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsId=<s:property value="newsId"/>">
							<s:property value="#status.count"/>-
							
							<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_LONG" />
							<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
							<s:property value="@com.lndp.utils.SubStringUtil@splitString(newsTitle , #subStringLen , #subStringElide)" />
						</a>
						<s:set name="isLatestDateGap" value="@com.lndp.constant.CommonConst@IS_LATEST_DATE_GAP" />
						<s:if test="@com.lndp.utils.DatetimeUtil@isLatest(updatedTime , #isLatestDateGap)">
							<img src="images/new.gif" width="22" height="9" />
						</s:if>
						<div><s:date name="updatedTime" format="yyyy-MM-dd"/></div>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>


	<div class="contentR">
		<div class="contentRT">
			<% 
				Contact contact = (Contact)application.getAttribute("contact"); 
			%>

			<div>
				<p><%=contact.getCompanyName() %></p>
			</div>

			<p>电话：<%=contact.getCompanyTel()%></p>
			<p>传真：<%=contact.getCompanyFax()%></p>
			<p>地址：<%=contact.getCompanyAddress()%></p>
		</div>

		<div class="contentRB">
			<div class="contentRBT">通知通告
				<a href="news_findForPageByType.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_TYPE_NOTICE"/>">
					<img src="images/more2.gif" width="36" height="11" />
				</a>
			</div>
			<ul>
				<%
				List<News> noticeList = newsService.findForIndexByType(NewsConst.NEWS_TYPE_NOTICE, CommonConst.HOME_NEWS_NOTICE_RECORD_COUNT);
				if(noticeList != null && noticeList.size() != 0){
					for(News news : noticeList){
						logger.info("News" + news + "] has been found.");
					}
					request.setAttribute("noticeList", noticeList);
				} else {
					logger.info("No news exist.");
				}
				%>
				<s:iterator value="#request.noticeList" status="status">
					<li>
						<a href="news_findById.action?viewType=<s:property 
							value="@com.lndp.constant.NewsConst@NEWS_VIEW_NEWS_CENTER"/>&newsId=<s:property value="newsId"/>" >
							<s:property value="#status.count"/>-
							
							<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_SHORT" />
							<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
							<s:property value="@com.lndp.utils.SubStringUtil@splitString(newsTitle , #subStringLen , #subStringElide)" />
						</a>
						<s:set name="isLatestDateGap" value="@com.lndp.constant.CommonConst@IS_LATEST_DATE_GAP" />
						<s:if test="@com.lndp.utils.DatetimeUtil@isLatest(updatedTime , #isLatestDateGap)">
							<img src="images/new.gif" width="22" height="9" />
						</s:if>
					</li>
				</s:iterator>
			</ul>
		</div>
	</div>
</div>
<!--content end-->

<!--recommend strat-->
<div class="recommend">
	<div class="recommendT">
		推荐商家
		<img src="images/tag8.gif" width="87" height="14" />
	</div>
	<div class="recommendC">
		<div class="gallery">
			<div id="slider">
				<ul>
					<!-- five start list -->
					<%
						List<Company> companyListFive = cmpService.findForIndexByRecommendRate(CommonConst.HOME_PAGE_RECOMMEND_RATE_FIVE, CommonConst.HOME_COMPANY_RECORD_COUNT);
						if(companyListFive != null && companyListFive.size() != 0){
							for(Company company : companyListFive){
								logger.info("Company " + company + "] has been found.");
							}
							request.setAttribute("companyListFive", companyListFive);
						} else {
							logger.info("No company exist.");
						}
					%>
					<li>
						<s:iterator value="#request.companyListFive" status="status">
							<div class="div">
								<div class="tuijian">
									<p class="tuijianT">
										<a href="company_findById.action?companyId=<s:property value="companyId"/>" class="tuijianT"> 
											<s:property value="#status.count"/>-
											<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_SHORT" />
											<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
											<s:property value="@com.lndp.utils.SubStringUtil@splitString(companyName , #subStringLen , #subStringElide)" />
										</a>
									</p>
									<p class="detail">铺号：<s:property value="shopLocation"/></p>
									<p class="detail">电话： <s:property value="phone"/></p>
									<p class="detail">传真：<s:property value="fax"/></p>
									<p class="detail">经营范围：
										<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_MIDDLE" />
										<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
										<s:property value="@com.lndp.utils.SubStringUtil@splitString(businessScope , #subStringLen , #subStringElide)" />
									</p>
									<p class="detail">网站：<a href="http://<s:property value="websiteAddress"/>" class="tuijianT"><s:property value="websiteAddress"/></a></p>
								</div>
							</div>
						</s:iterator>
					</li>


					<!-- four start list -->
					<%
						List<Company> companyListFour = cmpService.findForIndexByRecommendRate(CommonConst.HOME_PAGE_RECOMMEND_RATE_FOUR, CommonConst.HOME_COMPANY_RECORD_COUNT);
						if(companyListFour != null && companyListFour.size() != 0){
							for(Company company : companyListFive){
								logger.info("Company " + company + "] has been found.");
							}
							request.setAttribute("companyListFour", companyListFour);
						} else {
							logger.info("No company exist.");
						}
					%>
					<li>
						<s:iterator value="#request.companyListFour" status="status">
							<div class="div">
								<div class="tuijian">
									<p class="tuijianT">
										<a href="company_findById.action?companyId=<s:property value="companyId"/>" class="tuijianT"> 
											<s:property value="#status.count"/>-
											<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_SHORT" />
											<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
											<s:property value="@com.lndp.utils.SubStringUtil@splitString(companyName , #subStringLen , #subStringElide)" />
										</a>
									</p>
									<p class="detail">铺号：<s:property value="shopLocation"/></p>
									<p class="detail">电话： <s:property value="phone"/></p>
									<p class="detail">传真：<s:property value="fax"/></p>
									<p class="detail">经营范围：
										<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_MIDDLE" />
										<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
										<s:property value="@com.lndp.utils.SubStringUtil@splitString(businessScope , #subStringLen , #subStringElide)" />
									</p>
									<p class="detail">网站：<a href="http://<s:property value="websiteAddress"/>" class="tuijianT"><s:property value="websiteAddress"/></a></p>
								</div>
							</div>
						</s:iterator>
					</li>


					<!-- three start list -->
					<%
						List<Company> companyListThree = cmpService.findForIndexByRecommendRate(CommonConst.HOME_PAGE_RECOMMEND_RATE_THREE, CommonConst.HOME_COMPANY_RECORD_COUNT);
						if(companyListThree != null && companyListThree.size() != 0){
							for(Company company : companyListFive){
								logger.info("Company " + company + "] has been found.");
							}
							request.setAttribute("companyListThree", companyListThree);
						} else {
							logger.info("No company exist.");
						}
					%>
					<li>
						<s:iterator value="#request.companyListThree" status="status">
							<div class="div">
								<div class="tuijian">
									<p class="tuijianT">
										<a href="company_findById.action?companyId=<s:property value="companyId"/>" class="tuijianT"> 
											<s:property value="#status.count"/>-
											<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_MIDDLE" />
											<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
											<s:property value="@com.lndp.utils.SubStringUtil@splitString(companyName , #subStringLen , #subStringElide)" />
										</a>
									</p>
									<p class="detail">铺号：<s:property value="shopLocation"/></p>
									<p class="detail">电话： <s:property value="phone"/></p>
									<p class="detail">传真：<s:property value="fax"/></p>
									<p class="detail">经营范围：
										<s:set name="subStringLen" value="@com.lndp.constant.CommonConst@SUB_STRING_LEN_SHORT" />
										<s:set name="subStringElide" value="@com.lndp.constant.CommonConst@SUB_STRING_ELIDE" />
										<s:property value="@com.lndp.utils.SubStringUtil@splitString(businessScope , #subStringLen , #subStringElide)" />
									</p>
									<p class="detail">网站：<a href="http://<s:property value="websiteAddress"/>" class="tuijianT"><s:property value="websiteAddress"/></a></p>
								</div>
							</div>
						</s:iterator>
					</li>

				
				</ul>
			</div>
		</div>
	</div>
</div>
<!--recommend end-->
<jsp:include page="common/footer.jsp" flush="true"/>

</body>
</html>
