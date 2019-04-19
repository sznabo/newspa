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
<style>
body { font-family: "Microsoft YaHei",Helvetica,"Hiragino Sans GB",Arial,sans-serif; font-size: 3.5em; background:#e2e6ef; color:#222222;} 
a{ text-decoration:none; color:#222222; cursor:pointer; border:none;}
a:hover{ text-decoration:none; color:#222222; border:none;}
a:active{ color:#222222; border:none; }
.main1{ margin:0 auto; padding:0; width:98%; min-width:640px;}
.mainTit{ margin:1% 0;}
.main1No{ margin:0 auto; padding:0 0 0.2% 0; list-style-type:none; width:100%; display:block; overflow:hidden;}
.main1No li{ width:49%; margin:1% 0.1% 0 0.1%; padding:4% 0; text-align:center; -moz-border-radius: 20px 20px 20px 20px;    -webkit-border-radius: 20px 20px 20px 20px;    -o-border-radius:20px 20px 20px 20px;    border-radius: 20px 20px 20px 20px; background-color: #f3f3f3;    background: -webkit-linear-gradient(top,#F8F8F8 0,#eeeeee 100%);//代表从上到下，从白到蓝的渐变    background: -moz-linear-gradient(top,#F8F8F8 0,#eeeeee 100%);    background: -o-linear-gradient(top,#F8F8F8 0,#eeeeee 100%);    background: linear-gradient(to bottom,#F8F8F8 0,#eeeeee 100%); -moz-box-shadow:0 1px 3px #666666; -webkit-box-shadow:0 1px 3px #666666; box-shadow: 1px 1px 3px 0 #666666;}
.main1No li:active{ width:49%; margin:1% 0.1% 0 0.1%; padding:4% 0; text-align:center; -moz-border-radius: 20px 20px 20px 20px;    -webkit-border-radius: 20px 20px 20px 20px;    -o-border-radius:20px 20px 20px 20px;    border-radius: 20px 20px 20px 20px; background-color: #dadada;    background: -webkit-linear-gradient(top,#e5e5e5 0,#dadada 100%);//代表从上到下，从白到蓝的渐变    background: -moz-linear-gradient(top,#e5e5e5 0,#dadada 100%);    background: -o-linear-gradient(top,#F8F8F8 0,#eeeeee 100%);    background: linear-gradient(to bottom,#e5e5e5 0,#dadada 100%);-moz-box-shadow:0 1px 3px #666666; -webkit-box-shadow:0 1px 3px #666666; box-shadow: 1px 1px 3px 0 #666666;}
.Cance{ float:left;}
.Determin{ float:right;}
.main1No li input{ background:none; border:0;outline:medium; padding:1% 40%; margin:0 auto; text-align:center; display:block; font-size:1em;}

.mainInp{margin:2% 0; }
.mainInp input{padding:4% 0.5%; width:100%; border:none;  background-color: #f3f3f3;  font-size: 1em; }
.mainInp input:visited{ border:none; background:none;}
.mainInp [value]{ color:#555555;}

.Proble{ list-style-type:none;}
.Proble li{ margin:0 0 3% 0;}
.Proble li span{ display:block; font-size:40px; margin-top:1%; color:#555555;}
</style>
<script type="text/javascript">
function save(){
var serviceip = document.getElementById("serviceip").value;
var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/; 
if(serviceip.replace(/\s/g,"")==""){
	document.getElementById('error').innerHTML ="请按要求输入ip";	
	 return false;
}
if(!re.test(serviceip)){
    document.getElementById('error').innerHTML ="请使用标准的IP格式！";
    return false;
}
return true;
}

</script>
</head>

<body>
<s:if test="#session.language==1">
<s:form action="adremote/weixinAction/checkIp.action" method="post" onsubmit="return save();"> 
<div class="main1">
    <div class="mainTit">请输入盒子IP</div>
    <div class="mainInp"><input type="text" name="serverIp" id="serviceip" value="192.168.2.112" /></div>
    <div class="main1No">
        <li class="Cance"><input type="button" value="取消"/></li>
        <li class="Determin"><input type="submit" value="确定"/></li>
     </div>
     <ul class="Proble">
        <li>如何获取盒子IP？<span>进入盒子"设置 > 网络 > 网络状态"，可以看到IP.</span></li>
        <li>如何自动搜索到您的盒子？<span>盒子与手机在同一个局域网.</span></li>
     </ul>
</div>
<s:actionerror/>
</s:form>
</s:if>
<s:if test="#session.language==2">
<s:form action="adremote/weixinAction/checkIp.action" method="post" onsubmit="return save();"> 
<div class="main1">
    <div class="mainTit">Please enter the box IP</div>
    <div class="mainInp"><input type="text" name="serverIp" id="serviceip" value="192.168.2.112" /></div>
    <div class="main1No">
        <li class="Cance"><input type="button" value="cancel"/></li>
        <li class="Determin"><input type="submit" value="determine"/></li>
     </div>
     <ul class="Proble">
        <li>How to obtain box IP?<span>Enter the box"Set up the > network > The network status"，You can see the IP.</span></li>
        <li>How to automatically search to your box?<span>Boxes and mobile phones in the same local area network (LAN).</span></li>
     </ul>
</div>
<s:actionerror/>
</s:form>
</s:if>
</body>
</html>
