// JavaScript Document
lastScrollY = 0;
function heartBeat() {
	var diffY;
	if (document.documentElement && document.documentElement.scrollTop)
		diffY = document.documentElement.scrollTop;
	else if (document.body)
		diffY = document.body.scrollTop
	else {/* Netscape stuff */
	}

	// alert(diffY);
	percent = .1 * (diffY - lastScrollY);
	if (percent > 0)
		percent = Math.ceil(percent);
	else
		percent = Math.floor(percent);
	document.getElementById("ad_left").style.top = parseInt(document
			.getElementById("ad_left").style.top)
			+ percent + "px";
	document.getElementById("ad_right").style.top = parseInt(document
			.getElementById("ad_right").style.top)
			+ percent + "px";

	lastScrollY = lastScrollY + percent;
	// alert(lastScrollY);
}

if(!document.getElementById) {
	document.getElementById = function() {return null;};
}

function setStyle(element, property, value) {
	element = document.getElementById(element);
	if(element.style) {element.style[property] = value;}
}

function hideDiv(element) {
	setStyle(element, 'display', 'none');
}
function showDiv(element) {
	setStyle(element, 'display', '');
}
	
suspendcode12 = "<DIV id=\"ad_left\" name=\"ad_left\" style='left:22px;POSITION:absolute;TOP:69px;'>" +
		"<a href='http://www.163.com' target='_blank'>" +
		"<img border=0 src=resource/ad/img/ad_left.gif><br><a href=JavaScript:; " +
		"onclick=\"hideDiv('ad_left')\">" +
		"<img border=0 src=resource/ad/img/close.gif></a></div>"

suspendcode14 = "<DIV id=\"ad_right\" name=\"ad_right\" style='right:22px;POSITION:absolute;TOP:69px;'>" +
		"<a href='http://www.163.com' target='_blank'>" +
		"<img border=0 src=resource/ad/img/ad_right.gif><br><a href=JavaScript:; " +
		"onclick=\"hideDiv('ad_right')\">" +
		"<img border=0 src=resource/ad/img/close.gif></div>"

document.write(suspendcode12);
document.write(suspendcode14);
window.setInterval("heartBeat()", 1);
