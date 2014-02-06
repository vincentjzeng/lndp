<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<%@ page import="com.lndp.model.EMap" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<%@ taglib uri="/WEB-INF/googlemaps.tld" prefix="googlemaps" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="联系我们-电子地图"/>
		<base href="<%=basePath%>" />
		<title>联系我们-电子地图</title>
		<link href="resource/style/frontend/css/innerstyle.css" rel="stylesheet" type="text/css" />
		<!-- google api -->
		<!-- 
		<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=ABQIAAAA_vmrc48xBAK1c8TdG1NiqxTDVfdC6ocgzWdKKjuKNgRrDpyqABTEMLjokDxtliTAfIfJ6kTG_fCaKQ" 
			type="text/javascript">
		</script>
		 -->
		
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
	<body onload="initialize()" onunload="GUnload()">
		<jsp:include page="../common/header.jsp" flush="true" />


		<%
	 		Logger logger = Logger.getLogger(this.getClass().getName());
		
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
			
			EMap emap = (EMap) ctx.getBean("emap");
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
				<!--emap start -->
				<div class="contentCT">电子地图
	
				</div>
				<div class="contactUs">
					<p>
							广州岭南国际电子数码广场
					</p>
					<p>
							地址：广州市荔湾区新基路25号大楼
					</p>
					<p>
							公车站点：文化公园电车总站（下车即到）
					</p>
					<p>
							周边公车站点：南方大厦，六二三路，康王南路（3-5分钟步行距离）
					</p>
					<p>
							地铁：
					</p>
					<p>
							1.一号线黄沙D出口，过天桥到黄沙码头站，坐105电车（2站）到文化公园电车总站。
					</p>
					<p>
							2.一号线西门口C出口，在西门口公车站（即中六电脑城门口）坐102电车（4站）到文化公园电车总站。
					</p>

					<!--  
					<div class="address2"> 
						<img src="resource/style/common/img/index_top1.jpg" width="450" height="320" style="fload:right;align:right"/>
					</div>
					-->
					
					<!-- google map
					<div class="address2"> 
						<googlemaps:map id="map" width="250" height="300" version="2" type="STREET" 
								zoom="12">
						  	<googlemaps:key domain="http://netdemon.eicp.net" 
						  		key="ABQIAAAA_vmrc48xBAK1c8TdG1NiqxTDVfdC6ocgzWdKKjuKNgRrDpyqABTEMLjokDxtliTAfIfJ6kTG_fCaKQ"/>
						  	<googlemaps:point id="point1" address="74 Connors Lane" city="Elkton" 
						  			state="MD" zipcode="21921" country="US"/>
							<googlemaps:marker id="marker1" point="point1"/>
						</googlemaps:map>
					</div>
					 -->
	
					<!--  google api
					<div class="address2">
						<div id="map_canvas" style="width: 500px; height: 300px;" >
							<script type="text/javascript">
	
							    function initialize() {
							      if (GBrowserIsCompatible()) {
							        var map = new GMap2(document.getElementById("map_canvas"));
							        map.setCenter(new GLatLng(39.917, 116.397), 14);
							      }
							    }
							
							 </script>
						</div>
					</div>
					-->
					
					<!-- http://www.o.cn -->
					<div class="emap">
						<!-- 
						<iframe scrolling="<%=emap.getScrolling()%>" frameborder="<%=emap.getFrameborder()%>" 
							style="<%=emap.getStyle()%>" 
							src="<%=emap.getSrc()%>">
						</iframe>
						 -->
						<iframe src="http://gz.o.cn/page/mapapi/ifrmap.jsp?x=1102154&y=1066416&style=5&panels=map,around,traffic" width="650" height="600" scrolling="no" frameborder="0"></iframe>
					</div>
				</div>
				<!--emap end -->
			</div>
			<!--right end -->
			<br class="spacer" />
			<!--right end -->
			<br class="spacer" />
		</div>
		<!--bot end  -->
		<!--footer start  -->
		<jsp:include page="../common/footer.jsp" flush="true" />
	</body>
</html>
