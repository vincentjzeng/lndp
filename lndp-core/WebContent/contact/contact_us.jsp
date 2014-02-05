<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.lndp.model.Contact" %>

<%@ page import="com.lndp.model.ContactInfo" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="联系我们-联系信息"/>
		<base href="<%=basePath%>" />
		<title>联系我们-联系信息</title>
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
	 		Logger logger = Logger.getLogger(this.getClass().getName());
		
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
			
			ContactInfo contactInfo = (ContactInfo) ctx.getBean("contactInfo");
			
			Contact contact = (Contact)application.getAttribute("contact"); 
		%>		

		<!--bot start  -->
		<div id="bot">
			<!--left start -->
			<!--left end -->
			<!--mid start -->
			<jsp:include page="contact_menu.jsp" flush="true"/>
			<!--mid end -->
			<!--right start -->
			<div id="right">
				<!--contactUs start -->
				<div class="contentCT">联系我们
	
				</div>
				<div class="contactUs">
			
					<p>
							<%=contact.getCompanyName()%>
					</p>
					<p>
							发展商：<%=contact.getCompanyDeveloper()%>
					</p>
					<p>
							地址：<%=contact.getCompanyAddress()%>
					</p>
					<p>
							邮编：<%=contact.getCompanyPost()%>
					</p>
					<p>
							电话：<%=contact.getCompanyTel()%>
					</p>
					<p>
							传真：<%=contact.getCompanyFax()%>
					</p>
					<p>
							邮箱 : <a href="mailto:<%=contact.getCompanyEmail()%>"><%=contact.getCompanyEmail()%></a>
					</p>
					<p>
							网址：<a href="<%=contact.getCompanyWebsite()%>"><%=contact.getCompanyWebsite()%></a>
					</p>
					<p>
							客服QQ: 
							<a href=" http://sighttp.qq.com/cgi-bin/check?
								sigkey=ed413fb26382ce537c88ada5688d0cb1f5a856b7f7b45fe3d83cfa2b860f5f5e"; target=_blank; onclick="var tempSrc=' 
								http://sighttp.qq.com/wpa.js?rantime='+Math.random()
								+'&sigkey=ed413fb26382ce537c88ada5688d0cb1f5a856b7f7b45fe3d83cfa2b860f5f5e';var oldscript=document.getElementById
								('testJs');var newscript=document.createElement('script');newscript.setAttribute('type','text/javascript'); 
								newscript.setAttribute('id', 'testJs');newscript.setAttribute('src',tempSrc);if(oldscript == null)
								{document.body.appendChild(newscript);}else{oldscript.parentNode.replaceChild(newscript, oldscript);}return 
								false;"><img border="0" SRC=' http://wpa.qq.com/pa?p=1:910347130:42' alt=""></a>
					</p>
				</div>
				<!--contactUs end -->
			</div>
			<!--right end -->
			<br class="spacer" />

		</div>
		<!--bot end  -->
		<!--footer start  -->
		<jsp:include page="../common/footer.jsp" flush="true" />
	</body>
</html>
