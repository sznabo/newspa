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
		<base href="<%=basePath%>"/>

		<title>歌曲管理</title>

		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
		<meta http-equiv="description" content="This is my page"/>
		
		<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
		<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
		<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
		<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
		<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
		<script type="text/javascript">
		var a = <%=session.getAttribute("language")%>
		$(function() {
if(a==1){
	
}else if(a==2){
  $("input[type=file]").filestyle({
          image: "<%=basePath%>/res/images/file.png",
          imageheight : 22,
          imagewidth : 82,
          width : 150
      });
}
    
});
		
	function changeRight(url) {
	 window.parent.document.getElementById("iframepage").src=url;
	}
	
	function checkForm() {if(a==1){
		if (isValEmpty("songName")) {
			alert("请输入歌曲名称");
			return false;
		}
		/*var y = $("#year").val();
		if (y != "") {
			if (y.length != 4 || !Is_positive_num(y)) {
				alert("请输入正确的年份");
				return false;
			}
		}*/
		if (isValEmpty("singer")) {
			alert("请输入歌手");
			return false;
		}
		return true;
	}
	if(a==2){
		if (isValEmpty("songName")) {
			alert("Please enter the name of the song");
			return false;
		}
		/*var y = $("#year").val();
		if (y != "") {
			if (y.length != 4 || !Is_positive_num(y)) {
				alert("请输入正确的年份");
				return false;
			}
		}*/
		if (isValEmpty("singer")) {
			alert("Please enter the singer");
			return false;
		}
		return true;
	}
	}
</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule">
	 <div class="AlonModule_Top">
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                         <li><a href="<%=basePath%>song/list.action">歌曲管理</a></li>
                         <li class="currentHover"><a>>>修改歌曲</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>	
<div class="AlonModule_Body">
<div class="AlonModule_list">
 <s:form enctype="multipart/form-data" method="post" action="update" namespace="/song" onsubmit="return checkForm();">
 <s:hidden name="song.id"/>
 <table width="100%" class="listtable">
  <tr>
    <th scope="row"  width="10%" align="right">歌曲名称：</th>
    <td class="inp"> <s:textfield name="song.songName" id="songName" maxlength="100"/><font style="color: red;">*</font> </td>
  </tr>
  
 
  <tr>
    <th scope="row" align="right">歌手:</th>
    <td class="inp"> <s:textfield name="song.singer" id="singer" maxlength="50"/><font style="color: red;">*</font></td>
  </tr>
  
  <tr>
    <th scope="row" align="right">歌曲文件：</th>
    <td>
    	<input type="file" name="songFile" id="songFile"/>(不选择表示不更换)
    </td>
  </tr>
     <tr>
  <th scope="row" align="right">歌曲图片 ：</th>
    <td>
    	<input type="file" name="logo" id="logo"/>(不选择表示不更换)
    </td>
  </tr>
  <tr>
  <td class="addButton" align="center">
    </td>
    <td>  <input  class="submit" type="submit" value="提交"/>  <input type="button"   class="back" value="返回" onclick="window.location.href='<%=basePath%>song/list.action'"/></td>
  </tr>
</table>
</s:form>
 </div>
 </div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
	 <div class="AlonModule_Top">
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                         <li><a href="<%=basePath%>song/list.action">Song</a></li>
                         <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>	
<div class="AlonModule_Body">
<div class="AlonModule_list">
 <s:form enctype="multipart/form-data" method="post" action="update" namespace="/song" onsubmit="return checkForm();">
 <s:hidden name="song.id"/>
 <table width="100%" class="listtable">
  <tr>
    <th scope="row"  width="10%" align="right">Song name:</th>
    <td class="inp"> <s:textfield name="song.songNamee" id="songName" maxlength="100"/><font style="color: red;">*</font> </td>
  </tr>
  
 
  <tr>
    <th scope="row" align="right">Singer:</th>
    <td class="inp"> <s:textfield name="song.singere" id="singer" maxlength="50"/><font style="color: red;">*</font></td>
  </tr>
  
  <tr>
    <th scope="row" align="right">Song files:</th>
    <td>
    	<input type="file" name="songFile" id="songFile"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Choose not to say don't change)
    </td>
  </tr>
 <tr>
   <th scope="row" align="right">Song LOGO：</th>
    <td>
    	<input type="file" name="logo" id="logo"/>(不选择表示不更换)
    </td>
  </tr>
  <tr>
  <td class="addButton" align="center">
    </td>
    <td>  
     <input  class="submit" type="submit" value="Submit"/> 
     <input type="button"   class="back" value="Return" onclick="window.location.href='<%=basePath%>song/list.action'"/></td>
  </tr>
</table>
</s:form>
 </div>
 </div>
</div>
</s:if>
</body>
</html>
