<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<meta http-equiv="description" content="联系我们-留言查询"/>
		<base href="<%=basePath%>" />
		<title>联系我们-留言查询</title>
		<link href="resource/style/frontend/css/innerstyle.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}
-->
</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp" flush="true"/>
		<!--bot start  -->
		<div id="bot">
			<!--left start -->
			<!--left end -->
			<!--mid start -->
			<jsp:include page="contact_menu.jsp" flush="true"/>
			<!--mid end -->
			<!--right start -->
			<div id="right">
				<div class="contactbg_query">
					<div class="contactsubhead">
						If you have any questions, please fill out the form below and we
						will respond to you at the earliest.
					</div>
					<div class="contactsubhead">
						<span class="style1">*</span> indicates required fields
					</div>
					<div class="contacttext" id="sub">
						Subject:
					</div>
					<div class="contactdropdownformfield" id="subtbd">
						<select name="select" class="dropdownEffect">
							<option>
								Your Selection
							</option>
							<option>
								Your Selection
							</option>
						</select>
						<span class="style1">*</span>
					</div>
					<div class="contacttext" id="name">
						Your Name:
					</div>
					<div class="contactformfield" id="nametextbox">
						<input name="textfield22" type="text" class="textboxEffect" />
						<span class="style1">*</span>
					</div>
					<div class="contacttext" id="business">
						Business Name:
					</div>
					<div class="contactformfield" id="btextbox">
						<input name="textfield222" type="text" class="textboxEffect" />
					</div>
					<div class="contacttext" id="email">
						Email Address:
					</div>
					<div class="contactformfield" id="emailtextbox">
						<input name="textfield2222" type="text" class="textboxEffect" />
						<span class="style1">*</span>
					</div>
					<div class="contacttext" id="phno">
						Phone Number:
					</div>
					<div class="contactformfield" id="phtextbox">
						<input name="textfield22222" type="text" class="textboxEffect" />
						<span class="style1">*</span>
					</div>
					<div class="contacttext" id="cno">
						Cell Number:
					</div>
					<div class="contactformfield" id="celltextbox">
						<input name="textfield222222" type="text" class="textboxEffect" />
					</div>
					<div class="contacttext" id="contactvia">
						Contact Via:
					</div>
					<div class="contactdropdownformfield">
						<select name="select2" class="dropdownEffect">
							<option>
								Email
							</option>
							<option>
								Phone Number
							</option>
							<option>
								Cell Number
							</option>
						</select>
					</div>
					<div class="commenttext">
						Comments:
					</div>
					<div class="contactformmsgfild">
						<span class="contactformmessage"> <textarea name="textarea"
								class="MassageboxEffect" rows="" cols=""></textarea> </span>
					</div>
					<div class="submitarea">
						<label>
							<input name="Submit" type="submit" class="submitbutton"
								value="Submit" />
						</label>
					</div>
				</div>
			</div>
			<!--right end -->
			<br class="spacer" />
		</div>
		<!--bot end  -->
		<!--footer start  -->
		<jsp:include page="../common/footer.jsp" flush="true" />
	</body>
</html>
