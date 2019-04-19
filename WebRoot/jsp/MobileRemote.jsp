<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="res/css/MobileRemote.css" />
<script language="JavaScript" src="res/js/jquery-1.3.2.min.js"></script>
<script language="JavaScript" src="res/js/common.js"></script>
<script type="text/javascript">
function sendServer(msg,serverIp){
var param = "msg=" +msg+"&ip="+serverIp;
	$.ajax({
	   type: "POST",
	   async: false,
	   url: "adremote/weixinAction/getServer.action",
	   data: param,
	   success: function(msg){
		   exist = (eval( "("+msg +")")).data;
	   }
	});
}

</script>
</head>

<body>
<form action="">
<div class="main">
     <ul class="mainUl">
         <li class="mainUl1"><a onclick="sendServer('power','${serverIp }');"><img src="res/images/shutDown.png" /></a></li>
         <li class="mainUl2"><a onclick="sendServer('nvol','${serverIp }');"><img src="res/images/Mute.png" /></a></li>
     </ul>
     <ul class="mainNo">
        <li><a onclick="sendServer('one','${serverIp }');">1</a></li>
        <li><a onclick="sendServer('two','${serverIp }');">2</a></li>
        <li><a onclick="sendServer('three','${serverIp }');">3</a></li>
        <li><a onclick="sendServer('four','${serverIp }');">4</a></li>
        <li><a onclick="sendServer('five','${serverIp }');">5</a></li>
        <li><a onclick="sendServer('six','${serverIp }');">6</a></li>
        <li><a onclick="sendServer('serven','${serverIp }');">7</a></li>
        <li><a onclick="sendServer('eight','${serverIp }');">8</a></li>
        <li><a onclick="sendServer('nine','${serverIp }');">9</a></li>
        <li><a onclick="sendServer('home','${serverIp }');"><img src="res/images/home.png" /></a></li>
        <li><a onclick="sendServer('zero','${serverIp }');">0</a></li>
        <li><a onclick="sendServer('back','${serverIp }');"><img src="res/images/Back.png" /></a></li>
     </ul>
     <ul class="mainOk">
        <li>&nbsp;</li>
        <li class="up"><a onclick="sendServer('up','${serverIp }');"><img src="res/images/up.png" /></a></li>
        <li>&nbsp;</li>
        <li class="left"><a onclick="sendServer('left','${serverIp }');"><img src="res/images/left.png" /></a></li>
        <li class="mainOk_fan"><a onclick="sendServer('ok','${serverIp }');">OK</a></li>
        <li class="right"><a onclick="sendServer('right','${serverIp }');"><img src="res/images/right.png" /></a></li>
        <li>&nbsp;</li>
        <li class="down"><a onclick="sendServer('down','${serverIp }');"><img src="res/images/down.png" /></a></li>
        <li>&nbsp;</li>
     </ul>
     <ul class="mainNo">
         <li><a onclick="sendServer('volup','${serverIp }');"><img src="res/images/volJ.png" /></a></li>
         <li><a onclick="sendServer('rewind','${serverIp }');"><img src="res/images/Rewind.png" /></a></li>
         <li><a onclick="sendServer('delete','${serverIp }');"><img src="res/images/del.png" /></a></li>
         <li><a onclick="sendServer('voldown','${serverIp }');"><img src="res/images/volZ.png" /></a></li>
         <li><a onclick="sendServer('forward','${serverIp }');"><img src="res/images/FastForward.png" /></a></li>
         <li><a onclick="sendServer('play','${serverIp }');"><img src="res/images/st.png" /></a></li>
     </ul>
</div>
</form>
</body>
</html>
