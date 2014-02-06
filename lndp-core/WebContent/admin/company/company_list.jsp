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
		<meta http-equiv="description" content="商家信息-列表"/>
		<title>商家信息-列表</title>
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
						<h3>
							商家列表
						</h3>
						<form id="form" action="company_admin_findByCategoryId.action" method="post">
							商家类别 :
							<select id="categoryId" name="categoryId">
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
		
								<s:if test="#request.categoryId == 0 || #request.categoryId == null">
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

						<div id="companyList">
							<display:table name="companyList" pagesize="10" requestURI="company_admin_findAll.action" decorator="com.lndp.displaytag.decorator.CompanyListDecorator">
								<display:column property="companyName" title="公司名称" sortable="true" href="company_admin_findById.action?action=view" paramId="companyId" paramProperty="companyId" />
								<display:column property="shopLocation" title="商铺位置" sortable="true" />
								<display:column property="categoryId" title="类别" sortable="true" />
								<display:column property="updatedUser" title="更新用户" sortable="true" />
								<display:column property="updatedTime" title="更新时间" sortable="true" />
								<display:column property="operation" title="操作"  />
							</display:table>
						</div>
					</div>
					<br />
				</div>
				<jsp:include page="/admin/common/sidebar.jsp" flush="true" />
			</div>
			<jsp:include page="/admin/common/footer.jsp" flush="true" />
		</div>
	</body>
</html>

