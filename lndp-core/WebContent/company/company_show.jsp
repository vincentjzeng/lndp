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
		<meta http-equiv="description" content="商家名录-商家信息"/>
		<base href="<%=basePath%>" />
		<title>商家名录-商家信息</title>
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
				<!--contact start -->
				<div class="contentCT"><s:property value="#request.company.companyName"/>
	
				</div>
				<div class="compnayShow">
			
					<ul>
						
						<li style="height:auto;">
								<s:if test="#request.company.companyPicUrl != null">
									<img src="<s:property value="#request.company.companyPicUrl"/>" width="300" height="180" /> 
								</s:if>	
						</li>
						<li>
								公司简介 : <s:property value="#request.company.companyDesc" />
						</li>
						<li>
								经营范围 : <s:property value="#request.company.businessScope" />
						</li>
						<li>
								推荐指数 : 
								<s:if test="#request.company.recommendRate == 1">
									<img src="resource/style/common/img/star1.gif" width="85" height="18"/>
								</s:if>
								<s:elseif test="#request.company.recommendRate == 2">
									<img src="resource/style/common/img/star2.gif" width="85" height="18"/>
								</s:elseif>
								<s:elseif test="#request.company.recommendRate == 3">
									<img src="resource/style/common/img/star3.gif" width="85" height="18"/>
								</s:elseif>
								<s:elseif test="#request.company.recommendRate == 4">
									<img src="resource/style/common/img/star4.gif" width="85" height="18"/>
								</s:elseif>
								<s:elseif test="#request.company.recommendRate == 5">
									<img src="resource/style/common/img/star5.gif" width="85" height="18"/>
								</s:elseif>
								<s:else>
									无
								</s:else>
						</li>
						<li>
								
						</li>
						<li>
								联系方式
						</li>
						<!--  
						<li>
								公司地址 : <s:property value="#request.company.companyAddress" />
						</li>
						-->
						<li>
								商铺位置 : <s:property value="#request.company.shopLocation" />
						</li>
						<li>
								联系人 : <s:property value="#request.company.contactPerson" />
						</li>
						<li>
								固定电话 : <s:property value="#request.company.phone" />
						</li>
						<li>
								手机 : <s:property value="#request.company.mobile" />
						</li>
						<li>
								传真 : <s:property value="#request.company.fax" />
						</li>

						<li>
								电子邮件地址 : <a href="mailto:<s:property value="#request.company.email" />"> <s:property value="#request.company.email" /></a>
						</li>
						<li>
								QQ : <s:property value="#request.company.qq" />
						</li>
						<li>
								MSN : <s:property value="#request.company.msn" />
						</li>
						<li>
								阿里旺旺 : <s:property value="#request.company.aliTalk" />
						</li>
						<li>
								Google Talk : <s:property value="#request.company.googleTalk" />
						</li>
						<li>
								其它即时通讯方式 : <s:property value="#request.company.im" />
						</li>
						<li>
								公司网址 : <a href="http://<s:property value="#request.company.websiteAddress"/>"> <s:property value="#request.company.websiteAddress"/></a>
						</li>
						<li>
								淘宝店 : <s:property value="#request.company.taobao" />
						</li>
						<li>
								
						</li>
						<li>
								商家类别:
								<s:iterator id="companyCategory" value="#application.companyCategoryList">
									<s:if test="#request.company.categoryId == #companyCategory.categoryId">
										<s:property value="%{categoryName}"/>
									</s:if>
								</s:iterator>
						</li>
						<li>
								
						</li>
						<li>
								更新用户：<s:property value="#request.company.updatedUser"/>
						</li>
						<li>
								更新时间： <s:date name="#request.company.updatedTime" format="yyyy-MM-dd HH:mm:ss"/>
						</li>
						<li>
								<input type="submit" name="submit" class="submitbutton2" onclick="javascript:window.history.back();" value="后退"/>
						</li>
					</ul>
				</div>
				<!--contact end -->
				
			</div>
			<!--right end -->
			<br class="spacer" />
		</div>
		<!--bot end  -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
	</body>
</html>