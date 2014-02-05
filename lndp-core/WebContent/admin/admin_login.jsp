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
		<meta http-equiv="description" content="管理登录"/>
		<base href="<%=basePath%>" />
		<title>管理登录</title>
	
		<link href="resource/style/frontend/css/innerstyle.css"
			rel="stylesheet" type="text/css" />
		
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
		<jsp:include page="../common/header.jsp" flush="true" />
		<!--bot start  -->
		<div id="bot">
			<!--left start -->
			<!--left end -->
			<!--mid start -->
			<div id="mid">
				<h2>
					管理中心
				</h2>
				<p class="reg">
					<a href="admin/admin_login.jsp"><span>P</span>管理登录</a>
				</p>
				<jsp:include page="../common/left_menu.jsp" flush="true" />
				<br class="spacer" />
			</div>
			<!--mid end -->
			<!--right start -->
			<div id="right">
				<!--contact start -->
				<div class="contentCT">管理登录
	
				</div>
				<div class="adminLogin">
					<s:if test="#session.userinfo == null">
						<form name="form" action="securityMgr_login.action" method="post">
							<h5><s:fielderror></s:fielderror></h5>
							<ul>
								<li>
									用户名 ：
									<input type="text" name="username"/>
								</li>
								<li>
									密 &nbsp;&nbsp;码 ：&nbsp;
									<input type="password" name="password"/>
								</li>
								<li>
									验证码 ： 
									<input type="text" name="identifying_code"/>
									<script type="text/javascript">  
									    function changeValidateCode(obj) {
									    	//获取当前的时间作为参数，无具体意义  
									        var currentTime = new Date().getTime();  
									        //每次请求需要一个不同的参数，否则可能会返回同样的验证码  
									        //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。
									        obj.src="identifying_code.action?time="+currentTime;  
									    }  
									</script>  
									  
									<img src="identifying_code.action" onclick="changeValidateCode(this)"/> (点击图片更改验证码)
								</li>
								<li>
									<input type="submit" name="login" value="登录" />
									<input type="reset" name="reset" value="重置" />
								</li>
								<li>
									<h3>
										<s:property value="message"/>
										<%
											String errorInfo = (String)request.getAttribute("errorInfo");
											if(errorInfo != null && !"".equalsIgnoreCase(errorInfo)){
										%>
										<%=request.getAttribute("errorInfo") %>
										<% 	} %>

										
									</h3>
								</li>
								<li><input type="hidden" name=loginAttempt value="true" /></li>
							</ul>
							
						</form>
					</s:if>
					<s:else>
						<h4>
							欢迎  - <s:property value="#session.userinfo.username"/>
						</h4>
						<form name="form" action="securityMgr_logout.action" method="post">
							<div>
								<a href="company_admin_findAll.action">进入后台管理系统</a>
								<br class="spacer" />
								<br/>
								<input type="submit" name="submit" value="退出" />
							</div>
						</form>
						<h3><s:property value="message"/></h3>
					</s:else>
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