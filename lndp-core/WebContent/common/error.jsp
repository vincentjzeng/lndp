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
		<meta http-equiv="description" content="商家信息-添加"/>
		<title>错误</title>
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
							出错啦～
							<br/>
							${requestScope.message}
						</h3>
					</div>
				</div>
				<jsp:include page="/admin/common/sidebar.jsp" flush="true" />
			</div>
			<jsp:include page="/admin/common/footer.jsp" flush="true" />
		</div>
	</body>
</html>
