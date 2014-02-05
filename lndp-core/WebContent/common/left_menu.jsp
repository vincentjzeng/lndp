<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lndp.model.Contact" %>

<h2 class="newsletter">
	<% 
		Contact contact = (Contact)application.getAttribute("contact"); 
	%>

	电话：<%=contact.getCompanyTel()%>
	<br/>
	传真：<%=contact.getCompanyFax()%>
	<br/>
	邮编：<%=contact.getCompanyPost()%>
	<br/>
	客服QQ：<a href=" http://sighttp.qq.com/cgi-bin/check?
								sigkey=ed413fb26382ce537c88ada5688d0cb1f5a856b7f7b45fe3d83cfa2b860f5f5e"; target=_blank; onclick="var tempSrc=' 
								http://sighttp.qq.com/wpa.js?rantime='+Math.random()
								+'&sigkey=ed413fb26382ce537c88ada5688d0cb1f5a856b7f7b45fe3d83cfa2b860f5f5e';var oldscript=document.getElementById
								('testJs');var newscript=document.createElement('script');newscript.setAttribute('type','text/javascript'); 
								newscript.setAttribute('id', 'testJs');newscript.setAttribute('src',tempSrc);if(oldscript == null)
								{document.body.appendChild(newscript);}else{oldscript.parentNode.replaceChild(newscript, oldscript);}return 
								false;"><img border="0" SRC=' http://wpa.qq.com/pa?p=1:910347130:42' alt=""></a>
</h2>