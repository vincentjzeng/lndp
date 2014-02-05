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
		<meta http-equiv="description" content="商家信息-更新"/>
		<title>商家信息-更新</title>
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
				<jsp:include page="/admin/common/header_company.jsp" flush="true" />
				<div id="wrapper">
					<div id="content">
						<div id="box">
							<h3 id="adduser">
								更新商家
							</h3>
							<form id="form" action="company_admin_update.action" method="post" enctype="multipart/form-data">
								<fieldset id="personal">
									<legend>
										公司信息
									</legend>
									<ul>
										<li>注意： 标注为 <strong> * </strong> 的项目为必填项</li>
										<li>
											<strong> * </strong> 公司名称 : 
											<s:if test="#request.company != null">
												<input name="companyName" id="companyName" type="text" size="50" 
													value="<s:property value="#request.company.companyName"/>" maxlength="50" tabindex="1" />
											</s:if>
											<s:else>
												<input name="companyName" id="companyName" type="text" size="50" 
													value="<s:property value="#request.companyName"/>" maxlength="50" tabindex="1" />
											</s:else>
										</li>
										<s:fielderror ><s:param>companyName</s:param></s:fielderror>
										<li>
											公司图片  : 
											<s:if test="#request.company != null">
												<input name="file" id="file" type="file" tabindex="2" 
													value="<s:property value="#request.company.companyPicUrl"/>" size="50"/>
											</s:if>
											<s:else>
												<input name="file" id="file" type="file" tabindex="2" 
													value="<s:property value="#request.companyPicUrl"/>" size="50"/>
											</s:else>
										</li>
										<s:fielderror ><s:param>file</s:param></s:fielderror>
										<li>
											<s:if test="#request.company.companyPicUrl != null">
												<img src="<s:property value="#request.company.companyPicUrl"/>" width="350" height="200" align="middle" /> 
											</s:if>
										</li>
										<li>
											公司简介 : 
											<s:if test="#request.company != null">
												<textarea name="companyDesc" id="companyDesc" cols="60" rows="8" tabindex="3"><s:property value="#request.company.companyDesc"/></textarea>
											</s:if>
											<s:else>
												<textarea name="companyDesc" id="companyDesc" cols="60" rows="8" tabindex="3"><s:property value="#request.companyDesc"/></textarea>
											</s:else>
										</li>
										<s:fielderror ><s:param>companyDesc</s:param></s:fielderror>
										<li>
											<strong> * </strong>  经营范围  : 
											<s:if test="#request.company != null">
												<input name="businessScope" id="businessScope" type="text" 
													value="<s:property value="#request.company.businessScope"/>" size="80" maxlength="100" tabindex="4" />
											</s:if>
											<s:else>
												<input name="businessScope" id="businessScope" type="text" 
													value="<s:property value="#request.businessScope"/>" size="80" maxlength="100" tabindex="4" />
											</s:else>
										</li>
										<s:fielderror ><s:param>businessScope</s:param></s:fielderror>
										<li>
											<strong> * </strong> 推荐级数 :
											<select id="recommendRate" name="recommendRate" tabindex="5">
												<s:if test="#request.company != null">
													<s:set name="reqRecommendRate" value="#request.company.recommendRate"/>
												</s:if>
												<s:else>
													<s:set name="reqRecommendRate" value="#request.recommendRate"/>
												</s:else>

												<s:if test="#reqRecommendRate == 1">
													<option label="【1】星级 " value="1" selected="selected">【1】星级 </option>
												</s:if>
												<s:else>
													<option label="【1】星级 " value="1" >【1】星级 </option>
												</s:else>
												<s:if test="#reqRecommendRate == 2">
													<option label="【2】星级" value="2" selected="selected">【2】星级</option>
												</s:if>
												<s:else>
													<option label="【2】星级" value="2" >【2】星级</option>
												</s:else>
												<s:if test="#reqRecommendRate == 3">
													<option label="【3】星级" value="3" selected="selected">【3】星级</option>
												</s:if>
												<s:else>
													<option label="【3】星级" value="3" >【3】星级</option>
												</s:else>
												<s:if test="#reqRecommendRate == 4">
													<option label="【4】星级" value="4" selected="selected">【4】星级</option>
												</s:if>
												<s:else>
													<option label="【4】星级" value="4" >【4】星级</option>
												</s:else>
												<s:if test="#reqRecommendRate == 5">
													<option label="【5】星级" value="5" selected="selected">【5】星级</option>
												</s:if>
												<s:else>
													<option label="【5】星级" value="5" >【5】星级</option>
												</s:else>
											</select>
										</li>
										<s:fielderror ><s:param>categoryId</s:param></s:fielderror>
									</ul>
								</fieldset>
								<fieldset id="address">
									<legend>
										联系方式
									</legend>
									<ul>
										<li>
											公司地址  :		
											<s:if test="#request.company != null">
												<input name="companyAddress" id="companyAddress" type="text" 
													value="<s:property value="#request.company.companyAddress"/>" size="50" maxlength="200" tabindex="6" />
											</s:if>
											<s:else>
												<input name="companyAddress" id="companyAddress" type="text" 
													value="<s:property value="#request.companyAddress"/>" size="50" maxlength="200" tabindex="6" />
											</s:else>
										</li>
										<s:fielderror ><s:param>companyAddress</s:param></s:fielderror>
										<li>
											<strong> * </strong> 商铺位置 : 
											<s:if test="#request.company != null">
												<input name="shopLocation" id="shopLocation" type="text" 
													value="<s:property value="#request.company.shopLocation"/>" size="50" maxlength="200" tabindex="7" />
											</s:if>
											<s:else>
												<input name="shopLocation" id="shopLocation" type="text" 
													value="<s:property value="#request.shopLocation"/>" size="50" maxlength="200" tabindex="7" />
											</s:else>
											
										</li>
										<s:fielderror ><s:param>shopLocation</s:param></s:fielderror>
										<li>
											联系人 : 
											<s:if test="#request.company != null">
												<input name="contactPerson" id="contactPerson" type="text" 
													value="<s:property value="#request.company.contactPerson"/>"  size="50" maxlength="50" tabindex="12" />
											</s:if>
											<s:else>
												<input name="contactPerson" id="contactPerson" type="text" 
													value="<s:property value="#request.contactPerson"/>"  size="50" maxlength="50" tabindex="12" />
											</s:else>
										</li>
										<s:fielderror ><s:param>contactPerson</s:param></s:fielderror>
										<li>
											<strong> * </strong> 固定电话 :
											<s:if test="#request.company != null">
												<input name="phone" id="phone" type="text" 
													value="<s:property value="#request.company.phone"/>" size="50" maxlength="50"  tabindex="8" readonly="readonly"/>
											</s:if>
											<s:else>
												<input name="phone" id="phone" type="text" 
													value="<s:property value="#request.phone"/>" size="50" maxlength="50"  tabindex="8" value="020-81011888" readonly="readonly"/>
											</s:else>
										</li>
										<s:fielderror ><s:param>phone</s:param></s:fielderror>
										<li>
											手机 : 
											<s:if test="#request.company != null">
												<input name="mobile" id="mobile" type="text" 
													value="<s:property value="#request.company.mobile"/>"  size="50" maxlength="50" tabindex="9" />
											</s:if>
											<s:else>
												<input name="mobile" id="mobile" type="text" 
													value="<s:property value="#request.mobile"/>"  size="50" maxlength="50" tabindex="9" />
											</s:else>
										</li>
										<s:fielderror ><s:param>mobile</s:param></s:fielderror>
										<li>
											传真 :
											<s:if test="#request.company != null">
												<input name="fax" id="fax" type="text" 
													value="<s:property value="#request.company.fax"/>"  size="50" maxlength="50"  tabindex="10"/>
											</s:if>
											<s:else>
												<input name="fax" id="fax" type="text" 
													value="<s:property value="#request.fax"/>"  size="50" maxlength="50"  tabindex="10"/>
											</s:else>
										</li>
										<s:fielderror ><s:param>fax</s:param></s:fielderror>
										<li>
											电子邮件地址 : 
											<s:if test="#request.company != null">
												<input name="email" id="email" type="text" 
													value="<s:property value="#request.company.email"/>"  size="50" maxlength="50" tabindex="11" />
											</s:if>
											<s:else>
												<input name="email" id="email" type="text" 
													value="<s:property value="#request.email"/>"  size="50" maxlength="50" tabindex="11" />
											</s:else>
										</li>
										<s:fielderror ><s:param>email</s:param></s:fielderror>
										<li>
											QQ : 
											<s:if test="#request.company != null">
												<input name="qq" id="qq" type="text" 
													value="<s:property value="#request.company.qq"/>"  size="50" maxlength="50" tabindex="12" />
											</s:if>
											<s:else>
												<input name="qq" id="qq" type="text" 
													value="<s:property value="#request.qq"/>"  size="50" maxlength="50" tabindex="12" />
											</s:else>
										</li>
										<s:fielderror ><s:param>qq</s:param></s:fielderror>
										<li>
											MSN : 
											<s:if test="#request.company != null">
												<input name="msn" id="msn" type="text" 
													value="<s:property value="#request.company.msn"/>"  size="50" maxlength="50" tabindex="12" />
											</s:if>
											<s:else>
												<input name="msn" id="msn" type="text" 
													value="<s:property value="#request.msn"/>"  size="50" maxlength="50" tabindex="12" />
											</s:else>
										</li>
										<s:fielderror ><s:param>msn</s:param></s:fielderror>
										<li>
											阿里旺旺 : 
											<s:if test="#request.company != null">
												<input name="aliTalk" id="aliTalk" type="text" 
													value="<s:property value="#request.company.aliTalk"/>"  size="50" maxlength="50" tabindex="12" />
											</s:if>
											<s:else>
												<input name="aliTalk" id="aliTalk" type="text" 
													value="<s:property value="#request.aliTalk"/>"  size="50" maxlength="50" tabindex="12" />
											</s:else>
										</li>
										<s:fielderror ><s:param>aliTalk</s:param></s:fielderror>
										<li>
											Google Talk : 
											<s:if test="#request.company != null">
												<input name="googleTalk" id="googleTalk" type="text" 
													value="<s:property value="#request.company.googleTalk"/>"  size="50" maxlength="50" tabindex="12" />
											</s:if>
											<s:else>
												<input name="googleTalk" id="googleTalk" type="text" 
													value="<s:property value="#request.googleTalk"/>"  size="50" maxlength="50" tabindex="12" />
											</s:else>
										</li>
										<s:fielderror ><s:param>googleTalk</s:param></s:fielderror>
										<li>
											其它即时通讯方式 : 
											<s:if test="#request.company != null">
												<input name="im" id="im" type="text" 
													value="<s:property value="#request.company.im"/>"  size="50" maxlength="50" tabindex="12" />
											</s:if>
											<s:else>
												<input name="im" id="im" type="text" 
													value="<s:property value="#request.im"/>"  size="50" maxlength="50" tabindex="12" />
											</s:else>
										</li>
										<s:fielderror ><s:param>im</s:param></s:fielderror>
										<li>
											公司网址 : 
											<s:if test="#request.company != null">
												<input name="websiteAddress" id="websiteAddress" type="text" 
													value="<s:property value="#request.company.websiteAddress"/>" size="50" maxlength="50" tabindex="13" />
											</s:if>
											<s:else>
												<input name="websiteAddress" id="websiteAddress" type="text" 
													value="<s:property value="#request.websiteAddress"/>" size="50" maxlength="50" tabindex="13" />
											</s:else>
										</li>
										<s:fielderror ><s:param>websiteAddress</s:param></s:fielderror>
										<li>
											淘宝店 : 
											<s:if test="#request.company != null">
												<input name="taobao" id="taobao" type="text" 
													value="<s:property value="#request.company.taobao"/>" size="50" maxlength="50" tabindex="13" />
											</s:if>
											<s:else>
												<input name="taobao" id="taobao" type="text" 
													value="<s:property value="#request.taobao"/>" size="50" maxlength="50" tabindex="13" />
											</s:else>
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
											<select id="categoryId" name="categoryId" tabindex="14">
												<s:if test="#request.company != null">
													<s:set name="reqCategoryId" value="#request.company.categoryId"/>
												</s:if>
												<s:else>
													<s:set name="reqCategoryId" value="#request.categoryId"/>
												</s:else>
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
											</select>
										</li>
										<s:fielderror ><s:param>categoryId</s:param></s:fielderror>
									</ul>
								</fieldset>
								<div align="center">
									<input id="companyId" name="companyId" type="hidden" value="<s:property value="#request.company.companyId"/>" />
									<input id="button1" type="submit" value="更新" />
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
		</div>
	</body>
</html>

