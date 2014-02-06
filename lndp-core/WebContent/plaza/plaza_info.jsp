<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="岭南,国际,电子，数码，广场，通信，配件，手机，游戏机，动漫，商家，租赁，新闻，招聘"/>
		<meta http-equiv="description" content="广场概况"/>
		<base href="<%=basePath%>" />
		<title>广场概况</title>
	
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
			<div id="mid">
				<h2>
					岭南数码广场
				</h2>
				<p class="reg">
					<a href="plaza/plaza_info.jsp"><span>P</span>广场概况</a>
				</p>
				<jsp:include page="../common/left_menu.jsp" flush="true" />
				<br class="spacer" />
			</div>
			<!--mid end -->
			<!--right start -->
			<div id="right">
				<!--plaza start -->
				<div class="contentCT">广州岭南国际数码广场
	
				</div>
				<div class="plazaContent">
					<img src="resource/style/common/img/index_top1.jpg" width="550" height="380" 
						style="margin-top:10px;margin-left:10px;"/>
					<p>
						广州岭南国际电子数码广场由广州金立方数码科技有限公司开发和经营管理，
					金立方以商业地产、专业批发市场、营运管理为公司主要发展方向，拥有成熟的市场经验、雄厚的资金实力和专业的精英团队。
					</p>
					<p>
							广州岭南国际电子数码广场位于荔湾区西堤新基路25号大楼（该楼是按前苏联真理报原型而建，
				系欧洲建筑大师杰作，曾做新闻出版局、南方日报社办公楼）。西堤商圈是国内外知名的手机零配件、数码产品集散地，
				周边有南方大厦、新亚洲、南太、中环、广电、文园、粤景等数码市场，共同形成一个强大的电子产品核心商圈，
				商品年交易量位于全国的前列。
					</p>
					<p>
							广州岭南国际电子数码广场楼高六层，经营面积近万平方米，共有商铺六百多家，同时市场拥有多项优势。
					</p>
					<p>
							优越的地理位置
					</p>
					<p>
							就在文化公园电车总站旁，有十多条公交线停靠，地铁六号线和八号线换乘站文化公园即将开通，
				地铁的开通也将改变西堤商圈原有的人流方向，使人气逐渐往本项目靠拢；
					</p>
					<p>
							分层定位明确
					</p>
					<p>
							首层主营通讯、手机配件、数码产品配件，二、三层主营电玩、动漫、数码类产品零配件，四五六层旺铺式写字楼。
					</p>
					<p>
							完善的配套服务
					</p>
					<p>
							一楼设有金融服务专区，交行、农行、商行、中行等已提供全面服务，为采购商提供采买一站式的采购便利；
				三楼设有餐饮区和咖啡休闲区；提供全面的工商代理服务，并与专业物流公司合作为客户提供运输方便的一条龙配送服务。
					</p>
					<p>
							齐全的硬件设施
					</p>
					<p>
							全天侯视频监控系统；配套中央空调、双向手扶电梯、垂直升降梯；并配备有停车场。
					</p>
					<p>
							广州岭南国际电子数码广场自2009年8月8日开业以来，电玩龙头商户齐聚进驻本场，形成了市场鲜明的动漫、电玩、通讯配件的经营主题，
				市场人货两旺。
					</p>
					<p>
							采购电玩产品，请您到岭南来。
					</p>
				</div>
				<!--plaza end -->
			</div>
			<!--right end -->
			<br class="spacer" />
		</div>
		<!--bot end  -->
		<jsp:include page="../common/footer.jsp" flush="true"/>
	</body>
</html>