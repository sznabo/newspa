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
},5000);

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
<body onload="hujiao();">
<s:if test="#session.language==1">
<div id="top">
	<div id="topDiv">
             <div class="topLogo">
             	<img src="<%=basePath%>res/images/logo.png"/>
             </div>
	         <div class="tmenu" style="position:relative;">
                  <ul>
                  	<li class="nvhHome_hover"><a href="<%=basePath%>index/index.action"><img src="<%=basePath%>res/images/nvhHome.png"/><br/>系统首页</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1'));"><img src="<%=basePath%>res/images/shopintroduce.png"/><br/>自助服务</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>admin/vodPartAction_listVodPart.action'));"><img src="<%=basePath%>res/images/vodpart.png"/><br/>点播管理</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>liveCategory/list.action'));"><img src="<%=basePath%>res/images/live.png"/><br/>直播管理</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>song/list.action'));"><img src="<%=basePath%>res/images/song.png"/><br/>歌曲管理</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>appCategory/list.action'));"><img src="<%=basePath%>res/images/nvh3.png"/><br/>安卓应用</a></li> 
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight( '<%=basePath%>message/pagemessageAction.action'));"><img src="<%=basePath%>res/images/Subtitle.png"/><br/>广告管理</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>servermsg/serverMsgAction_home.action'));"><img src="<%=basePath%>res/images/guestbook.png"/><br/>留言管理</a></li>
	                 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>device/pagedeciveAction.action'));"><img src="<%=basePath%>res/images/nvh4.png"/><br/>终端管理</a></li>
	                 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight( '<%=basePath%>soft/list.action'));"><img src="<%=basePath%>res/images/nvh5.png"/><br/>系统管理</a></li>
	             </ul> 
	           <div style="height:50px; position:absolute; right:0; bottom:0px;">
	           <a id="audeo" href="javascript:void(changeRight( '<%=basePath%>calling/callingAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email" src="<%=basePath%>res/images/noneemail.png" border="none"  hidefocus="true"
	                class="email"/><font style="color:white;" >有<span id="unreadcount">0</span>条未读信息</font></a>
                      <audio src="<%=basePath%>11.mp3" controls="controls" preload id="music1" hidden></audio>
	                <br/>
	           <!--  <a href="javascript:void(changeRight( '<%=basePath%>wakeup/wakeUpAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email1" src="<%=basePath%>res/images/noneemail.png" border="none" style="padding-top:10px;" hidefocus="true"
	                class="email"/><font style="color:white;" >有<span id="unresult">0</span>条叫醒服务</font><br/></a></div> -->

             </div>
      </div>
</div>
<div class="IndexBody">
     <div class="IndexContent">
          <iframe src="<%=basePath%>index/home.action" marginheight="0" allowtransparency=”true” marginwidth="0" frameborder="0" scrolling="no" width="100%" height=625 id="iframepage" name="iframepage"   ></iframe>
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
	         <div class="tmenu" style="position:relative;">
                  <ul>
                  	<li class="nvhHome_hover"><a href="<%=basePath%>index/index.action"><img src="<%=basePath%>res/images/nvhHome.png"/><br/>Home</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>shopintroduce/shopIntroduceAction_home.action?model.lv=1'));"><img src="<%=basePath%>res/images/shopintroduce.png"/><br/>Service</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>admin/vodPartAction_listVodPart.action'));"><img src="<%=basePath%>res/images/vodpart.png"/><br/>Demand</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>liveCategory/list.action'));"><img src="<%=basePath%>res/images/live.png"/><br/>Live</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>song/list.action'));"><img src="<%=basePath%>res/images/song.png"/><br/>Song</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>appCategory/list.action'));"><img src="<%=basePath%>res/images/nvh3.png"/><br/>App</a></li> 
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight( '<%=basePath%>message/pagemessageAction.action'));"><img src="<%=basePath%>res/images/Subtitle.png"/><br/>Ad</a></li>
                  	 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>servermsg/serverMsgAction_home.action'));"><img src="<%=basePath%>res/images/guestbook.png"/><br/>Message</a></li>
	                 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight('<%=basePath%>device/pagedeciveAction.action'));"><img src="<%=basePath%>res/images/nvh4.png"/><br/>Terminal</a></li>
	                 <li ><a onclick="takeFocs(this)" href="javascript:void(changeRight( '<%=basePath%>soft/list.action'));"><img src="<%=basePath%>res/images/nvh5.png"/><br/>System</a></li>
	             </ul> 
	           <div style="height:50px; position:absolute; right:0; bottom:0px;">
	           <a id="audeo" href="javascript:void(changeRight( '<%=basePath%>calling/callingAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email" src="<%=basePath%>res/images/noneemail.png" border="none"  hidefocus="true"
	                class="email"/><font style="color:white;" ><span id="unreadcount">&nbsp;0 &nbsp;</span>&nbsp;Msg</font></a>
                      <audio src="<%=basePath%>11.mp3" controls="controls" preload id="music1" hidden></audio>
	                <br/>
	           <!--  <a href="javascript:void(changeRight( '<%=basePath%>wakeup/wakeUpAction_home.action'));" style="text-decoration:none; outline:none;star:expression(this.onFocus=this.blur());"><img id="email1" src="<%=basePath%>res/images/noneemail.png" border="none" style="padding-top:10px;" hidefocus="true"
	                class="email"/><font style="color:white;" >有<span id="unresult">0</span>条叫醒服务</font><br/></a></div> -->

             </div>
      </div>
</div>
<div class="IndexBody">
     <div class="IndexContent">
          <iframe src="<%=basePath%>index/home.action" marginheight="0" allowtransparency=”true” marginwidth="0" frameborder="0" scrolling="no" width="100%" height=625 id="iframepage" name="iframepage"   ></iframe>
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
	     <div style="text-align: center;color: #111111;font-size:12px;" >Copyright &copy; 2012 - 2017. All Rights Reserved &nbsp;</div>
     </div>
</div>
</div>
</s:if>
</body>
</html>


