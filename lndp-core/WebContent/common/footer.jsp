<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<%@ page import="com.lndp.model.Advertisement" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href="<%=basePath%>"/>
<!--ad strat-->
<div id="ad_footer" align="center" class="ad">
	<%
 		Logger logger = Logger.getLogger(this.getClass().getName());
	
		WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
		
		Advertisement footerAd = (Advertisement) ctx.getBean("footerAd");
	%>
	

	
	<script type="text/javascript"><!--
	google_ad_client = "ca-pub-8496756424024686";
	/* 页首横幅728-90 */
	google_ad_slot = "0204703763";
	google_ad_width = 768;
	google_ad_height = 90;
	//-->
	</script>
	<script type="text/javascript"
	src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
	
	<script type="text/javascript"><!--
	google_ad_client = "ca-pub-8496756424024686";
	/* 页面横幅200&#42;90 */
	google_ad_slot = "8318313540";
	google_ad_width = 220;
	google_ad_height = 90;
	//-->
	</script>
	<script type="text/javascript"
	src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
	</script>
</div>
<!--ad end-->

<!--footLink strat-->
<div class="footLink">
	<div class="footLinkL">
		<ul>
			<li><a href="index.jsp">主页</a></li>
			<li><a href="news_findForIndexByType.action?viewType=3">人才招聘</a></li>
			<li><a href="contact/contact_us.jsp">联系我们</a></li>
			<li><a href="admin/admin_login.jsp">管理登录</a></li>
			<li>
				<script type="text/javascript">
				  var _gaq = _gaq || [];
				  _gaq.push(['_setAccount', 'UA-27792570-1']);
				  _gaq.push(['_trackPageview']);
				
				  (function() {
				    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
				  })();
				</script>
			</li>
		</ul>
	</div>

	<div class="footLinkR">
		<div>法律顾问：</div>
		<img src="images/Logo.gif" width="23" height="29" /><a href="http://www.lawyerpower.com.cn">法威大状</a></div>
	</div>
	<!--footLink end-->
	
	<!--copyright strat-->
	<div class="copyright">
		广州金立方数码科技有限公司 版权所有, 粤ICP备10097999号
		<BR>
		Copyright &copy; 2010, <a href="http://www.lndigi.com">www.lndigi.com</a>, All Rights Reserved.
		<BR>
	</div>
<!--copyright end-->