<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="商家信息-添加"/>
		<title>商家信息-添加</title>
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
						<h3 id="adduser">
							添加公司
						</h3>
						<form id="form" action="company_admin_add.action" method="post" enctype="multipart/form-data">
							<fieldset id="company">
								<legend>
									公司信息
								</legend>
								<ul>
									<li>注意： 标注为 <strong> * </strong> 的项目为必填项</li>
									<li>
										<strong> * </strong> 公司名称 :  
										<input name="companyName" id="companyName" type="text" size="50" 
											value="<s:property value="#request.companyName"/>" maxlength="50" tabindex="1" />
									</li>
									<s:fielderror ><s:param>companyName</s:param></s:fielderror>
									<li>
										公司图片  : 
										<input name="file" id="file" type="file" tabindex="2" size="50" />
									</li>
									<s:fielderror><s:param>file</s:param></s:fielderror>
									<li>
										公司简介 : 
										<textarea name="companyDesc" id="companyDesc" cols="60" rows="8" tabindex="3"><s:property value="#request.companyDesc"/></textarea>
									</li>
									<s:fielderror ><s:param>companyDesc</s:param></s:fielderror>
									<li>
										<strong> * </strong>  经营范围  :
										<input name="businessScope" id="businessScope" type="text" 
											value="<s:property value="#request.businessScope"/>" size="80" maxlength="100" tabindex="4" />
									</li>
									<s:fielderror ><s:param>businessScope</s:param></s:fielderror>
									<li>
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
									</li>
									<s:fielderror ><s:param>recommendRate</s:param></s:fielderror>
								</ul>
							</fieldset>
							<fieldset id="address">
								<legend>
									联系方式
								</legend>
								<ul>
									<li>
										公司地址  :
										<input name="companyAddress" id="companyAddress" type="text" 
											value="<s:property value="#request.companyAddress"/>" size="50" maxlength="200" tabindex="6" />
									</li>
									<s:fielderror ><s:param>companyAddress</s:param></s:fielderror>
									<li>
										<strong> * </strong> 商铺位置 :
										<input name="shopLocation" id="shopLocation" type="text" 
											value="<s:property value="#request.shopLocation"/>" size="50" maxlength="200" tabindex="7" />
									</li>
									<s:fielderror ><s:param>shopLocation</s:param></s:fielderror>
									<li>
										联系人 :
										<input name="contactPerson" id="contactPerson" type="text" 
											value="<s:property value="#request.contactPerson"/>"  size="50" maxlength="50" tabindex="12" />
									</li>
									<s:fielderror ><s:param>contactPerson</s:param></s:fielderror>
									<li>
										<strong> * </strong> 固定电话 :
										<input name="phone" id="phone" type="text" 
											value="020-81011888" size="50" maxlength="50"  tabindex="8" readonly="readonly"/>
									</li>
									<s:fielderror ><s:param>phone</s:param></s:fielderror>
									<li>
										手机 :
										<input name="mobile" id="mobile" type="text" 
											value="<s:property value="#request.mobile"/>"  size="50" maxlength="50" tabindex="9" />
									</li>
									<s:fielderror ><s:param>mobile</s:param></s:fielderror>
									<li>
										传真 :
										<input name="fax" id="fax" type="text" 
											value="<s:property value="#request.fax"/>"  size="50" maxlength="50"  tabindex="10"/>
									</li>
									<s:fielderror ><s:param>fax</s:param></s:fielderror>
									<li>
										电子邮件地址 :
										<input name="email" id="email" type="text" 
											value="<s:property value="#request.email"/>"  size="50" maxlength="50" tabindex="11" />
									</li>
									<s:fielderror ><s:param>email</s:param></s:fielderror>
									<li>
										QQ :
										<input name="qq" id="qq" type="text" 
											value="<s:property value="#request.qq"/>"  size="50" maxlength="50" tabindex="12" />
									</li>
									<s:fielderror ><s:param>qq</s:param></s:fielderror>
									<li>
										MSN :
										<input name="msn" id="msn" type="text" 
											value="<s:property value="#request.msn"/>"  size="50" maxlength="50" tabindex="12" />
									</li>
									<s:fielderror ><s:param>msn</s:param></s:fielderror>
									<li>
										阿里旺旺  :
										<input name="aliTalk" id="aliTalk" type="text" 
											value="<s:property value="#request.aliTalk"/>"  size="50" maxlength="50" tabindex="12" />
									</li>
									<s:fielderror ><s:param>aliTalk</s:param></s:fielderror>
									<li>
										Google Talk :
										<input name="googleTalk" id="googleTalk" type="text" 
											value="<s:property value="#request.googleTalk"/>"  size="50" maxlength="50" tabindex="12" />
									</li>
									<s:fielderror ><s:param>googleTalk</s:param></s:fielderror>
									<li>
										其它即时通讯方式 :
										<input name="im" id="im" type="text" 
											value="<s:property value="#request.im"/>"  size="50" maxlength="50" tabindex="12" />
									</li>
									<s:fielderror ><s:param>im</s:param></s:fielderror>
									<li>
										公司网址 :
										<input name="websiteAddress" id="websiteAddress" type="text" 
											value="<s:property value="#request.websiteAddress"/>" size="50" maxlength="50" tabindex="13" />
									</li>
									<s:fielderror ><s:param>websiteAddress</s:param></s:fielderror>
									<li>
										淘宝店 :
										<input name="taobao" id="taobao" type="text" 
											value="<s:property value="#request.taobao"/>" size="50" maxlength="50" tabindex="13" />
									</li>
									<s:fielderror ><s:param>taobao</s:param></s:fielderror>
								</ul>
							</fieldset>
							<fieldset id="opt">
								<legend>
									商家类别
								</legend>
								<ul>
									<li>
										<strong> * </strong> 商家类别  :
										<select name="categoryId"  tabindex="14" >
											<s:iterator id="companyCategory" value="#application.companyCategoryList">
												<s:set name="tmpCategoryId" value="#companyCategory.categoryId"/> 
												<s:if test="#request.categoryId == #tmpCategoryId">
													<option label="<s:property value="%{categoryName}"/>" 
															value="<s:property value="%{categoryId}"/>" selected="selected">
														<s:property value="%{categoryName}"/>
													</option>
												</s:if>
												<s:else>
													<option label="<s:property value="%{categoryName}"/>" 
															value="<s:property value="%{categoryId}"/>" >
														<s:property value="%{categoryName}"/>
													</option>
												</s:else>
											</s:iterator>
										</select>
									</li>
									<s:fielderror ><s:param>categoryId</s:param></s:fielderror>
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
