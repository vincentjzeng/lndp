<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>
  
<base href="<%=basePath%>"/>

<!--  
<script src="resource/ad/js/news.js" language="JavaScript"></script>
-->
<!--navigation strat-->
<div class="navigation">
	<div class="navigationL">
	</div>
	<div class="navigationC">
		<div class="navigationCL">
			<div class="logo">
				<a href="index.jsp"><img src="images/top_logo.gif" width="250" height="25" /></a>
			</div>
			<ul>
				<li><a href="plaza/plaza_info.jsp">广场概况</a></li>
				<li><a href="company_findForPage.action">商家名录</a></li>
				<li><a href="news_findForIndexByType.action?viewType=2">新闻中心</a></li>
				<li><a href="news_findForIndexByType.action?viewType=1">物业租赁</a></li>
				<li><a href="news_findForIndexByType.action?viewType=3">人才招聘</a></li>
				<li><a href="contact/contact_us.jsp">联系我们</a></li>
			</ul>
		</div>
		<div class="navigationCR">
		</div>
	</div>
	<div class="navigationR">
	</div>
</div>
<!--navigation end-->

<!--banner strat-->
<div class="banner">
<script type=text/javascript>
var pic_width=995; //图片宽度
var pic_height=340; //图片高度
var button_pos=4; //按扭位置 1左 2右 3上 4下
var stop_time=10000; //图片停留时间(1000为1秒钟)
var show_text=0; //是否显示文字标签 1显示 0不显示
var txtcolor="000000"; //文字色
var bgcolor="FFFFFF"; //背景色
var imag=new Array();
var link=new Array();
var text=new Array();
imag[1]="images/01.jpg";
link[1]=".";

imag[2]="images/02.jpg";
link[2]=".";

imag[3]="images/03.jpg";
link[3]=".";

imag[4]="images/04.jpg";
link[4]=".";

imag[5]="images/05.jpg";
link[5]=".";
//可编辑内容结束
var swf_height=show_text==1?pic_height+20:pic_height;
var pics="", links="", texts="";
for(var i=1; i<imag.length; i++){
	pics=pics+("|"+imag[i]);
	links=links+("|"+link[i]);
	texts=texts+("|"+text[i]);
}
pics=pics.substring(1);
links=links.substring(1);
texts=texts.substring(1);
document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cabversion=6,0,0,0" width="'+ pic_width +'" height="'+ swf_height +'">');
document.write('<param name="movie" value="flash/focus.swf">');
document.write('<param name="quality" value="high"><param name="wmode" value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'">');
document.write('<embed src="flash/focus.swf" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'" quality="high" width="'+ pic_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');
document.write('</object>');
</script>
</div>
<!--banner end-->