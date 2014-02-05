<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<meta http-equiv="description" content="商家名录-商家目录"/>
		<base href="<%=basePath%>" />
		<title>商家名录-商家目录</title>
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
			<jsp:include page="company_menu.jsp" flush="true"/>
			<!--mid end -->
			<!--right start -->
			<div id="right">
				<form id="search_form" name="search_form" action="company_findForPageByCriteria.action" method="post">
					<h2>推荐商家 </h2>
					<br/>
					<strong> * </strong> 商家类别 : 
					<select id="categoryId" name="categoryId" >
						<s:set name="reqCategoryId" value="#request.categoryId"/> 
						<s:iterator id="companyCategory" value="#application.companyCategoryList">
							<s:if test="#companyCategory.categoryId == #reqCategoryId">
								<option selected="selected" label="<s:property value="%{categoryName}"/>" 
										value="<s:property value="%{categoryId}"/>">
									<s:property value="%{categoryName}"/>
								</option>
							</s:if>
							<s:else>
								<option label="<s:property value="%{categoryName}"/>" 
										value="<s:property value="%{categoryId}"/>">
									<s:property value="%{categoryName}"/>
								</option>
							</s:else>
						</s:iterator>
						
						<s:if test="#request.categoryId == null || #request.categoryId == ''">
							<option selected="selected" label="全部" value="">
								全部
							</option>
						</s:if>
						<s:else>
							<option label="全部" value="">
								全部
							</option>
						</s:else>
					</select>
					<strong> * </strong>  推荐指数  :
					<select id="recommendRate" name="recommendRate" tabindex="5">
						<s:if test="#request.recommendRate == 1">
							<option label="【1】星级 " value="1" selected="selected">【1】星级 </option>
						</s:if>
						<s:else>
							<option label="【1】星级 " value="1" >【1】星级 </option>
						</s:else>
						<s:if test="#request.recommendRate == 2">
							<option label="【2】星级" value="2" selected="selected">【2】星级</option>
						</s:if>
						<s:else>
							<option label="【2】星级" value="2" >【2】星级</option>
						</s:else>
						<s:if test="#request.recommendRate == 3">
							<option label="【3】星级" value="3" selected="selected">【3】星级</option>
						</s:if>
						<s:else>
							<option label="【3】星级" value="3" >【3】星级</option>
						</s:else>
						<s:if test="#request.recommendRate == 4">
							<option label="【4】星级" value="4" selected="selected">【4】星级</option>
						</s:if>
						<s:else>
							<option label="【4】星级" value="4" >【4】星级</option>
						</s:else>
						<s:if test="#request.recommendRate == 5">
							<option label="【5】星级" value="5" selected="selected">【5】星级</option>
						</s:if>
						<s:else>
							<option label="【5】星级" value="5" >【5】星级</option>
						</s:else>
					</select>
					<br/>
					<br/>
					<strong> * </strong>  商家名称 : 
					<input type="text" id="companyName" name="companyName" value="<s:property value="#request.companyName"/>"/>
					<strong> * </strong>  商铺位置 : 
					<input type="text" id="shopLocation" name="shopLocation" value="<s:property value="#request.shopLocation"/>"/>
					<input type="submit" name="submit" class="submitbutton2" value="查询"/>
					
				</form>
				<br/>
				
				<s:iterator value="pageBean.list" status="status">
					<div class="leftTxt">
						<a href="company_findById.action?companyId=<s:property value="companyId"/>"> 
							<s:if test="#request.companyPicUrl != null">
								<img src="<s:property value="companyPicUrl"/>" width="220" height="130" align="middle" /> 
							</s:if>
						</a>
					</div>
					
					<div class="rightTxt">
						<ul class="rightLinkX">
							<li>
								<a href="company_findById.action?companyId=<s:property value="companyId"/>">
									 <s:property value="companyName"/>
								</a>
							</li>
							<li>铺号：<s:property value="shopLocation"/></li>
							<li>电话：<s:property value="phone"/></li>
							<li>传真：<s:property value="fax"/></li>
							<li>经营范围：<s:property value="businessScope"/></li>
							<li>网站：<a href="http://<s:property value="websiteAddress"/>"><s:property value="websiteAddress"/></a></li>
						</ul>
					</div>
					<p class="rightTxt3"></p>
				</s:iterator>

				
	
				<div class="pager">
					<form id="page_form" name="page_form"  action="company_findForPageByCriteria.action" method="post">
						<s:if test="%{pageBean.currentPage == 1}">第一页</s:if>
						<s:else>
							<a href="company_findForPageByCriteria.action?targetPage=<s:property 
								value="%{pageBean.currentPage - 1}"/>&categoryId=<s:property 
								value="#request.categoryId" />&recommendRate=<s:property 
								value="#request.recommendRate" />&companyName=<s:property 
								value="#request.companyName" />&shopLocation=<s:property 
								value="#request.shopLocation" /> ">
								<img src="resource/style/backend/img/icons/arrow_left.gif" width="16" height="16"/> 
							</a>
						</s:else>
						<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
							<a href="company_findForPageByCriteria.action?targetPage=<s:property 
								value="%{pageBean.currentPage + 1}"/>&categoryId=<s:property 
								value="#request.categoryId" />&recommendRate=<s:property 
								value="#request.recommendRate" />&companyName=<s:property 
								value="#request.companyName" />&shopLocation=<s:property 
								value="#request.shopLocation" />">
								<img src="resource/style/backend/img/icons/arrow_right.gif" width="16" height="16" />
							</a>
						</s:if>
						<s:else>最后一页</s:else>
						<input type="hidden" name="categoryId" value="<s:property value="#request.categoryId" />"></input>
						<input type="hidden" name="recommendRate" value="<s:property value="#request.recommendRate" />"></input>
						<input type="hidden" name="companyName" value="<s:property value="#request.companyName" />"></input>
						<input type="hidden" name="shopLocation" value="<s:property value="#request.shopLocation" />"></input>
						跳转到第
						<input type="text" name="targetPage" id="targetPage" size="2" value="<s:property value="pageBean.currentPage"/>"  />
						页
						<input type="submit" name="submit" class="submitbutton2" value="查询"/>
						<br/>
						<br/>
						当前第【  <s:property value="pageBean.currentPage"/> 】页
						总共【 <s:property value="pageBean.totalPage"/> 】页 | 每页
						<select name="pageSize">
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