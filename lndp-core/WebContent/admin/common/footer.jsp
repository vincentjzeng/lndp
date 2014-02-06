<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ "/";
%>

<base href="<%=basePath%>"/>

<div id="footer">
	<div id="credits">
		广州金立方数码科技有限公司 版权所有, 粤ICP备10097999号
		<BR>
		Copyright &copy; 2010, <a href="http://www.lndigi.com">www.lndigi.com</a>, All Rights Reserved.
	</div>
	<div id="styleswitcher">
		<ul>
			<li>
				<a
					href="javascript: document.cookie='theme='; window.location.reload();"
					title="Default" id="defswitch">d</a>
			</li>
			<li>
				<a
					href="javascript: document.cookie='theme=1'; window.location.reload();"
					title="Blue" id="blueswitch">b</a>
			</li>
			<li>
				<a
					href="javascript: document.cookie='theme=2'; window.location.reload();"
					title="Green" id="greenswitch">g</a>
			</li>
			<li>
				<a
					href="javascript: document.cookie='theme=3'; window.location.reload();"
					title="Brown" id="brownswitch">b</a>
			</li>
			<li>
				<a
					href="javascript: document.cookie='theme=4'; window.location.reload();"
					title="Mix" id="mixswitch">m</a>
			</li>
			<li>
				<a
					href="javascript: document.cookie='theme=5'; window.location.reload();"
					title="Mix" id="defswitch">m</a>
			</li>
		</ul>
	</div>
	<br />

</div>