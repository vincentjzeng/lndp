<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>


<%@ taglib prefix="s" uri="/struts-tags"%>

<s:if test="#request.viewType == 1">
	<div id="mid">
		<h2>
			租赁中心
		</h2>
		<p class="reg">
			<a href="news_findForIndexByType.action?viewType=1"><span>I</span>租赁索引</a>
		</p>
		<p class="reg">
			<a href="news_findForPageByType.action?viewType=1&newsType=1"><span>L</span>物业租赁</a>
		</p>
		<jsp:include page="../common/left_menu.jsp" flush="true" />
		<br class="spacer" />
	</div>

</s:if>
<s:elseif test="#request.viewType == 2">
	<div id="mid">
		<h2>新闻中心</h2>
		<p class="reg"><a href="news_findForIndexByType.action?viewType=2"><span>I</span>新闻索引</a>
		</p>
		<p class="reg"><a href="news_findForPageByType.action?viewType=2&newsType=2"><span>P</span>广场新闻</a>
		</p>
		<p class="reg"><a href="news_findForPageByType.action?viewType=2&newsType=3"><span>N</span>通知通告</a>
		</p>
		<p class="reg"><a href="news_findForPageByType.action?viewType=2&newsType=5"><span>I</span>行业动态</a>
		</p>
		<jsp:include page="../common/left_menu.jsp" flush="true" />
		<br class="spacer" />
	</div>
</s:elseif>
<s:elseif test="#request.viewType == 3">
	<div id="mid">
		<h2>
			招聘中心
		</h2>
		<p class="reg">
			<a href="news_findForIndexByType.action?viewType=3"><span>I</span>招聘索引</a>
		</p>
		<p class="reg">
			<a href="news_findForPageByType.action?viewType=3&newsType=4"><span>R</span>人才招聘</a>
		</p>
		<jsp:include page="../common/left_menu.jsp" flush="true" />
		<br class="spacer" />
	</div>
</s:elseif>
