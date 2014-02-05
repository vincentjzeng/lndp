<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="商家信息-展示"/>
		<title>商家信息-展示</title>
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
			<jsp:include page="/admin/common/header_company.jsp" flush="true" />
			<div id="wrapper">
				<div id="content">
					<div id="box">
						<h3 id="companyInfo">
							查看公司信息
						</h3>
						<form id="form" action="company_admin_.action" method="post">
							<fieldset id="companyInfoDetail">
								<legend>
									公司信息
								</legend>
								<ul>
									<li>
										公司名称: 
										<h2><s:property value="#request.company.companyName" /></h2>
									</li>
									<li>
										公司图片  : 
										<a href="#"> 
											<s:if test="#request.company.companyPicUrl != null">
												<img src="<s:property value="#request.company.companyPicUrl"/>" width="350" height="200" align="middle" /> 
											</s:if>
										</a>
									</li>
									<li>
										公司简介 : 
										<s:property value="#request.company.companyDesc" />
									</li>
									<li>
										经营范围  :
										<s:property value="#request.company.businessScope" />
									</li>
									<li>
										推荐指数  :
										【<s:property value="#request.company.recommendRate" />】星级
									</li>
								</ul>
							</fieldset>
							<fieldset id="address">
								<legend>
									联系方式
								</legend>
								<ul>
									<li>
										公司地址  :
										<s:property value="#request.company.companyAddress" />
									</li>
									<li>
										商铺位置 :
										<s:property value="#request.company.shopLocation" />
									</li>
									<li>
										联系人 :
										<s:property value="#request.company.contactPerson" />
									</li>
									<li>
										 固定电话 :
										<s:property value="#request.company.phone" />
									</li>
									<li>
										手机 :
										<s:property value="#request.company.mobile" />
									</li>
									<li>
										传真 :
										<s:property value="#request.company.fax" />
									</li>
									<li>
										电子邮件地址 :
										<s:property value="#request.company.email" />
									</li>
									<li>
										QQ :
										<s:property value="#request.company.qq" />
									</li>
									<li>
										MSN :
										<s:property value="#request.company.msn" />
									</li>
									<li>
										阿里旺旺 :
										<s:property value="#request.company.aliTalk" />
									</li>
									<li>
										Google Talk :
										<s:property value="#request.company.googleTalk" />
									</li>
									<li>
										其它即时通讯方式 :
										<s:property value="#request.company.im" />
									</li>
									<li>
										公司网址 :
										<s:property value="#request.company.websiteAddress" />
									</li>
									<li>
										淘宝店 :
										<s:property value="#request.company.taobao" />
									</li>
								</ul>
							</fieldset>
							<fieldset id="opt">
								<legend>
									商家类别
								</legend>
								<ul>
									<li>
										经营类型 :
										<s:iterator id="companyCategory" value="#application.companyCategoryList">
											<s:if test="#request.company.categoryId == #companyCategory.categoryId">
												<s:property value="%{categoryName}"/>
											</s:if>
										</s:iterator>
									</li>
								</ul>
							</fieldset>
							<input type="hidden" name="companyId" value="<s:property value="#request.company.companyId" />"/>
							<input type="hidden" name="action" value="update"/>
							<div align="right">
								<input id="back" type="button" value="后退" onclick="javascript:window.history.back();"/>
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

