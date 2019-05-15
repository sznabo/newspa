<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+
	request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
	#wrap{word-break:break-all; width:500px; overflow:auto;}
</style>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>

<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<script language="JavaScript" src="<%=basePath %>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>res/js/jquery-1.3.2.min.js"></script>



<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>

<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
<script type="text/javascript">
 
</script>
</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1" ><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">本店介绍</a></li>
                      <li class="currentHover"><a>>>预览</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="shopIntroduceAction_viewIntroduce" namespace="/shopintroduce" method="post">
     <div class="AlonModule_Body"  >
		<table width="10%" class="listtable">
		<s:hidden name="model.id" ></s:hidden>
		
			<tr>
				<td class="inp" rowspan="2">
					<div style="color:black;width:543px;height:476px;">
						
						<!-- 如果左侧内容为无 -->
						<s:if test="#session.viewFlag == 0">
						<font style="margin-left:200px;margin-top:150px;">无内容显示</font>
						</s:if> 
						<s:if test="#session.viewFlag == 1">
							<!-- 如果左侧内容为单个图片，则显示 -->
								<img align="middle" width="543px" height="476px" src="<%=basePath%>${adDetail.path}"/>
						</s:if>  
						<s:if test="#session.viewFlag == 2">
							<font style="margin-left:200px;margin-top:150px;">此为多张图片</font>
						</s:if>
						<s:if test="#session.viewFlag == 3">
							<!-- 如果左侧内容为视频时 -->
								<font style="margin-left:200px;margin-top:150px;">此为视频</font>
						</s:if>
						<s:if test="#session.viewFlag == 4">
							<!-- 如果左侧内容为视频时 -->
								<font style="margin-left:200px;margin-top:150px;">此为flash</font>
						</s:if>
				    </div>
				</td>
			</tr>
			<tr>
				<td class="inp">
				<div style="margin-left:-3px;padding-left:25px;color:black;width:1022px;height:476px;overflow: auto;background-color:#1697f3;" >
				        ${model.description}
				    </div>
				</td>
			</tr>
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
				<input colspan="2" type="button" name="back" value="关闭" class="STYLE1" onclick="window.history.go(-1);"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1" ><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">This shop is introduced</a></li>
                      <li class="currentHover"><a>>>preview</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="shopIntroduceAction_viewIntroduce.action" namespace="/shopintroduce" method="post">
     <div class="AlonModule_Body"  >
		<table width="10%" class="listtable">
		<s:hidden name="model.id" ></s:hidden>
		
			<tr>
				<td class="inp" rowspan="2">
					<div style="color:black;width:543px;height:476px;">
						
						<!-- 如果左侧内容为无 -->
						<s:if test="#session.viewFlag == 0">
						<font style="margin-left:200px;margin-top:150px;">There is no content</font>
						</s:if> 
						<s:if test="#session.viewFlag == 1">
							<!-- 如果左侧内容为单个图片，则显示 -->
								<img align="middle" width="543px" height="476px" src="<%=basePath%>${adDetail.path}"/>
						</s:if>  
						<s:if test="#session.viewFlag == 2">
							<font style="margin-left:200px;margin-top:150px;">The multiple images</font>
						</s:if>
						<s:if test="#session.viewFlag == 3">
							<!-- 如果左侧内容为视频时 -->
								<font style="margin-left:200px;margin-top:150px;">This is a video</font>
						</s:if>
						<s:if test="#session.viewFlag == 4">
							<!-- 如果左侧内容为视频时 -->
								<font style="margin-left:200px;margin-top:150px;">This is a flash</font>
						</s:if>
				    </div>
				</td>
			</tr>
			<tr>
				<td class="inp">
				<div style="margin-left:-3px;padding-left:25px;color:black;width:1022px;height:476px;overflow: auto;background-color:#1697f3;" >
				        ${model.description}
				    </div>
				</td>
			</tr>
			
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
				<input colspan="2" type="button" name="back" value="Shut down" class="STYLE1" onclick="window.history.go(-1);"/>
		    </td>
			</tr>
		</table>
     </div>
	</s:form>
</div>
</div>
</div>
</s:if>

</body>
</html>

