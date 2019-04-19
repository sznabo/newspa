<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>水疗系统</title>
<link href="<%=basePath%>res/css/top.css" rel="stylesheet" />
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/audioplayer.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/main.js"></script>
<style type="text/css">
.tmenu1{ margin:0; width:78%; float:left; min-width:780px; _width:expression(document.body.clientWidth < 780 ? "780px" : "auto"); }
.tmenu1 ul{ margin:0; list-style-type:none;}
.tmenu1 ul li{ float:left; width:15%; height:80px; margin:10px 0 0 1px; border-left:1px solid #1374cd;}
.tmenu1 ul li a {
display:block;
width:100%;
height:96px;
line-height:44px;
color:#aecfee;
direction:none;
text-align:center;
text-decoration:none;
outline:none;
star:expression(this.onFocus=this.blur());
}
</style>

<script type="text/javascript">

$(document).ready(function() {
	// Store variables
	var accordion_head = $('.accordion > li > a'),
		accordion_body = $('.accordion li > .sub-menu');
	// Open the first tab on load
	accordion_head.first().addClass('active').next().slideDown('normal');
	// Click function
	accordion_head.on('click', function(event) {
		// Disable header links
		event.preventDefault();
		// Show and hide the tabs on click
		if ($(this).attr('class') != 'active'){
			accordion_body.slideUp('normal');
			$(this).next().stop(true,true).slideToggle('normal');
			accordion_head.removeClass('active');
			$(this).addClass('active');
		}
	});
});

function changeRight( url) {
	$("#iframepage").attr("src", url);
}

function takeFocs(el) {
	$(el).parent().parent().find("li").removeClass("nvhHome_hover");
	$(el).parent().addClass("nvhHome_hover");
}

function hujiao(){
var audio = document.getElementById('music1'); 
	var exist = 0;
	$.ajax({
		type:  "POST",
		async: false,
		url:  "<%=basePath%>calling/callingAction_unreadMsg.action",
		success: function(msg){
			exist = msg.msgBody;
		}
	});
	//alert(exist);
	if(exist == 0){
	
		$('#unreadcount').text(exist);
		$('#email').attr("src","<%=basePath%>res/images/noneemail.png");
	}else{
		$('#unreadcount').text(exist);
		
		$('#email').attr("src","<%=basePath%>res/images/haveemail.gif");
		audio.play();
	}
	
}

//呼叫信息
setInterval(function(){
var audio = document.getElementById('music1'); 
	var exist = 0;
	$.ajax({
		type:  "POST",
		async: false,
		url:  "<%=basePath%>calling/callingAction_unreadMsg.action",
		success: function(msg){
			exist = msg.msgBody;
		}
	});
	//alert(exist);
	if(exist == 0){
	
		$('#unreadcount').text(exist);
		$('#email').attr("src","<%=basePath%>res/images/noneemail.png");
	}else{
		$('#unreadcount').text(exist);
		
		$('#email').attr("src","<%=basePath%>res/images/haveemail.gif");
		audio.play();
	}
	return exist;
},30000);

//叫醒信息 

//setInterval(function(){
///var audio = document.getElementById('music1'); 
//	var exist = 0;
//	$.ajax({
//		type:  "POST",
//		async: false,
//		url:  "<%=basePath%>wakeup/wakeUpAction_unResult.action",
	//	success: function(msg){
//			exist = msg.msgBody;
//		}
//	});
	//alert(exist);
//	if(exist == 0){
//		$('#unresult').text(exist);
//		$('#email1').attr("src","<%=basePath%>res/images/noneemail.png");
//	}else{
//		$('#unresult').text(exist);
//		$('#email1').attr("src","<%=basePath%>res/images/haveemail.gif");
//		audio.play();
//	}
//	return exist;
//},5000);

</script>
</head>
<body onload="hujiao();" style="background-color：transparent;">
<s:if test="#session.language==1">
<div id="top">
	<div id="topDiv">
             <div class="topLogo">
             	<img src="<%=basePath%>res/images/logo.png"/>
             </div>
	         <div class="tmenu1" style="position:relative;">
                  <ul>
                  	 <li ><a id="audeo" href="javascript:void(changeRight( '<%=basePath%>calling/callingAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email" src="<%=basePath%>res/images/noneemail.png" border="none"  hidefocus="true"
	                class="email"/><font style="color:white;" >有<span id="unreadcount">0</span>条未读信息</font></a></li>
	             </ul> 
	           <div style="height:50px; position:absolute; right:0; bottom:0px;">
	  
                      <audio src="<%=basePath%>11.mp3" controls="controls" preload id="music1" hidden></audio>
	                <br/>
	          
             </div>
      </div>
</div>
<div class="IndexBody">
     <div class="IndexContent">
          <iframe src="<%=basePath%>res/images/syshome.png" marginheight="0" allowtransparency=”true” marginwidth="0" frameborder="0" scrolling="yes" width="100%" height=625 id="iframepage" name="iframepage"></iframe>
                  <script type="text/javascript">
					            function iFrameHeight() {
                                    var ifm= document.getElementById("iframepage");
                                    var subWeb = document.frames ? document.frames["iframepage"].document :
                                    ifm.contentDocument;
                                    if(ifm != null && subWeb != null) {
                                    ifm.height = subWeb.body.scrollHeight;
                                  }
                               }
	             </script>
	     <div style="text-align: center;color: #111111;font-size:12px;" >Copyright &copy; 2012 - 2016. All Rights Reserved &nbsp;</div>
     </div>
</div>
</div>
</s:if>
<s:if test="#session.language==2">
<div id="top">
	<div id="topDiv">
             <div class="topLogo">
             	<img src="<%=basePath%>res/images/logo.png"/>
             </div>
	         <div class="tmenu1" style="position:relative;">
                  <ul>
                  	 <li ><a id="audeo" href="javascript:void(changeRight( '<%=basePath%>calling/callingAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email" src="<%=basePath%>res/images/noneemail.png" border="none"  hidefocus="true"
	                class="email"/><font style="color:white;" ><span id="unreadcount">0</span>Message</font></a></li>
	             </ul> 
	           <div style="height:50px; position:absolute; right:0; bottom:0px;">
	  
                      <audio src="<%=basePath%>22.mp3" controls="controls" preload id="music1" hidden></audio>
	                <br/>
	          
             </div>
      </div>
</div>
<div class="IndexBody">
     <div class="IndexContent">
          <iframe src="<%=basePath%>res/images/syshome.png" marginheight="0" allowtransparency=”true” marginwidth="0" frameborder="0" scrolling="yes" width="100%" height=625 id="iframepage" name="iframepage"></iframe>
                  <script type="text/javascript">
					            function iFrameHeight() {
                                    var ifm= document.getElementById("iframepage");
                                    var subWeb = document.frames ? document.frames["iframepage"].document :
                                    ifm.contentDocument;
                                    if(ifm != null && subWeb != null) {
                                    ifm.height = subWeb.body.scrollHeight;
                                  }
                               }
	             </script>
	     <div style="text-align: center;color: #111111;font-size:12px;" >Copyright &copy; 2012 - 2016. All Rights Reserved &nbsp;</div>
     </div>
</div>
</div>
</s:if>
<s:else>
<div id="top">
	<div id="topDiv">
             <div class="topLogo">
             	<img src="<%=basePath%>res/images/logo.png"/>
             </div>
	         <div class="tmenu1" style="position:relative;">
                  <ul>
                  	 <li ><a id="audeo" href="javascript:void(changeRight( '<%=basePath%>calling/callingAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email" src="<%=basePath%>res/images/noneemail.png" border="none"  hidefocus="true"
	                class="email"/><font style="color:white;" ><span id="unreadcount">0</span>Message</font></a></li>
	             </ul> 
	           <div style="height:50px; position:absolute; right:0; bottom:0px;">
	  
                      <audio src="<%=basePath%>22.mp3" controls="controls" preload id="music1" hidden></audio>
	                <br/>
	          
             </div>
      </div>
</div>
<div class="IndexBody">
     <div class="IndexContent">
          <iframe src="<%=basePath%>res/images/syshome.png" marginheight="0" allowtransparency=”true” marginwidth="0" frameborder="0" scrolling="yes" width="100%" height=625 id="iframepage" name="iframepage"></iframe>
                  <script type="text/javascript">
					            function iFrameHeight() {
                                    var ifm= document.getElementById("iframepage");
                                    var subWeb = document.frames ? document.frames["iframepage"].document :
                                    ifm.contentDocument;
                                    if(ifm != null && subWeb != null) {
                                    ifm.height = subWeb.body.scrollHeight;
                                  }
                               }
	             </script>
	     <div style="text-align: center;color: #111111;font-size:12px;" >Copyright &copy; 2012 - 2016. All Rights Reserved &nbsp;</div>
     </div>
</div>
</div>

</s:else>
</body>
</html>


