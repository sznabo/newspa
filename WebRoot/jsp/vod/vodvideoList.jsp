<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
int i=1;
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>列表</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="<%=basePath%>js/my97datepicker/WdatePicker.js" defer="defer"></script>
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
function selectAll() {
		var obj = document.getElementsByName('vedioid');
		var tige = document.getElementById('delid').checked;
		//var tige2 = document.getElementById('undelid');
		//tige2.checked = false;
		if(tige == true){
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].id == 'vedioid') {
					obj[i].checked = true;
				}
			}
		}else{
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].id == 'vedioid') {
					obj[i].checked = false;
				}
			}
		}
		
	}

	function unselectAll() {
		var obj = document.getElementsByName('vedioid');
		var tige = document.getElementById('delid');
		tige.checked= false;
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].name == 'vedioid') {
				if (obj[i].checked == true)
					obj[i].checked = false;
				else
					obj[i].checked = true;
			}
		}
	}

	function delVideo() {if(a==1){
		var obj = document.getElementsByName('vedioid');
		var vodprogramid = document.getElementById("vodprogramid").value;
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
		        var type = confirm("确认要删除么");
			        if(type == false){
			        	return;
			        }
				location.href = "admin/vodVideoAction_delVodvideo.action?vodprogramid="+vodprogramid+"&videoID="+ids;
				}
	}
	if(a==2){
		var obj = document.getElementsByName('vedioid');
		var vodprogramid = document.getElementById("vodprogramid").value;
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('Please choose！');
		        return false;
		    }else {
		        var type = confirm("Confirm to delete it");
			        if(type == false){
			        	return;
			        }
				location.href = "admin/vodVideoAction_delVodvideo.action?vodprogramid="+vodprogramid+"&videoID="+ids;
				}
	}
	}
	//批量获得ID,供生成xml适用(*********)
	function gainIDs(){if(a==1){
		var obj = document.getElementsByName('vedioid');
		var vodprogramid = document.getElementById("vodprogramid").value;
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
				window.location.href = "admin/vodVideoAction_releaseVodvideos.action?videoId="+ids+"&vodprogramid="+vodprogramid+"&type=videoList";
				}
	}
	if(a==2){
		var obj = document.getElementsByName('vedioid');
		var vodprogramid = document.getElementById("vodprogramid").value;
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('Please choose！');
		        return false;
		    }else {
				window.location.href = "admin/vodVideoAction_releaseVodvideos.action?videoId="+ids+"&vodprogramid="+vodprogramid+"&type=videoList";
				}
	}
	}
	
	//取消发布，可批量取消发布
	function revokeRelease(){if(a==1){
		var obj = document.getElementsByName('vedioid');
		var vodprogramid = document.getElementById("vodprogramid").value;
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
				window.location.href = "admin/vodVideoAction_revokeRelease.action?videoId="+ids+"&vodprogramid="+vodprogramid+"&type=videoList";
				}
	}
	if(a==2){
		var obj = document.getElementsByName('vedioid');
		var vodprogramid = document.getElementById("vodprogramid").value;
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					ids.push(id);
			}
		}
			if (ids.length<=0){
		        alert('Please choose！');
		        return false;
		    }else {
				window.location.href = "admin/vodVideoAction_revokeRelease.action?videoId="+ids+"&vodprogramid="+vodprogramid+"&type=videoList";
				}
	}
	}	
	
	function loadLiveLink(liveid){
		window.location.href = "admin/liveManagement_loadLiveByID.action?liveid="+liveid+"&type=modifyLive";
	}
	
	function liveSingleInfo(liveid){
		window.location.href = "admin/liveManagement_loadLiveByID.action?liveid="+liveid+"&type=liveInfo";		
	}	

	function addVideo(){
		//获得program的ID
		var vodprogramid = document.getElementById("vodprogramid").value;
		window.location.href = "admin/vodVideoAction_skip.action?vodprogramid="+vodprogramid+"&type=skip";
	}	
	
	//修改Vodvideo对象
	function loadVideoLink(id){
		var vodprogramid = document.getElementById("vodprogramid").value;
		window.location.href = "admin/vodVideoAction_viewVodvideo.action?id="+id + "&vodprogramid=" + vodprogramid ;
	}

	//查看Vodvideo对象
	function viewVodvideoLink(id){
		//window.location.href = "admin/vodVideoAction_viewVodvideo.action?id="+id+"&type=viewVideo";
	}	
	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?")) {
		var vodprogramid = document.getElementById("vodprogramid").value;
			window.location.href = "admin/vodVideoAction_delVodvideo.action?vodprogramid="+vodprogramid+"&videoID="+id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
		var vodprogramid = document.getElementById("vodprogramid").value;
			window.location.href = "admin/vodVideoAction_delVodvideo.action?vodprogramid="+vodprogramid+"&videoID="+id;
		}
	}
	}
	function findVodpartName(){
		document.getElementById("searchForm").submit();
	}
	
	
	   function macLead(){if(a==1){
		var xls = document.getElementById('xls').value;
		if(xls!=null&&xls.replace(/\s/g,"")!=""){
			var type = xls.split(".");
			if(type[1]=='xls' || type[1]=='xlsx' ){
				return true;
			}else{
				document.getElementById('error2').innerHTML = "&nbsp;&nbsp;请选择标准的excel文件";
				return false;
			}
		}else{
			document.getElementById('error2').innerHTML = "&nbsp;&nbsp;请选择标准的excel文件";
			return false;
		}
		return false;
	}
	if(a==2){
		var xls = document.getElementById('xls').value;
		if(xls!=null&&xls.replace(/\s/g,"")!=""){
			var type = xls.split(".");
			if(type[1]=='xls' || type[1]=='xlsx' ){
				return true;
			}else{
				document.getElementById('error2').innerHTML = "&nbsp;&nbsp;Please select a standard excel file";
				return false;
			}
		}else{
			document.getElementById('error2').innerHTML = "&nbsp;&nbsp;Please select a standard excel file";
			return false;
		}
		return false;
	}
	}
	
</script>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<s:if test="#session.language==1">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">点播栏目管理</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action">【${sessionScope.vodpart.vodpartname}】节目列表</a></li>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" >>>【${vodprogram.voidprogramname}】节目剧集系列</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="admin/vodVideoAction_browseVodvideoByVodprogramID.action" namespace="/admin" id="searchForm">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	<s:hidden name="vodprogramid" id="vodprogramid" value="%{model.vodprogramid}"></s:hidden>
  									视频名称:
  									<s:textfield name="voidname" id="voidname" maxlength="50" style="margin-left:10px"></s:textfield>
  									<input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px"/>
									<input type="button" value="返&nbsp;回" class="Sear" style="margin-left:10px" onclick="window.location.href='admin/vodProgram_viewVodprogram.action'"/>
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground" >
	                              	 <a href="<%=basePath%>admin/vodVideoAction_skip.action?vodprogramid=${vodprogramid}"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delVideo());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <s:form action="admin/vodVideoAction_macRead.action" namespace="/admin" method="post" enctype="multipart/form-data">
                  <input type="submit" class="right-button08" value="批量导入" onclick=" return macLead();" style="margin-left: 60px;margin-right:5px" />
		  		    <s:file name="xls" id="xls" size="40"></s:file>
		  		   <font style="color: red;size: 15px"><span id="error2"></span></font>
		  		   <s:if test="messge == 1"><span style="color:red;">导入成功！</span></s:if>
		  		   <s:elseif test="messge == 2"><span style="color:red;">导入失败！请检查格式</span></s:elseif>
		  	   </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <s:hidden name="vodprogramid" id="vodprogramid"></s:hidden>
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
						<th scope="col" width="23%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">视频名称</div></th>
						<th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">路径</div></th>
						<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">发布时间</div></th>	
						<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">操作</div></th>		
					  </tr>
					  
					 <s:form namespace="/admin" action="vodVideoAction_delVodvideo.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <!-- checkbox -->
				        <td width="2%" height="25" class="STYLE1" bgcolor="#EEEEEE" align="center"><input type="checkbox" class="checkCls" id="vedioid" name="vedioid" value="${id}"/></td> 
				        <!-- 视频名称 -->
				        <td width="23%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
				        <div align="center"><s:property value="voidname"/></div></td>
				        <!-- 地址 -->
				        <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center"><s:property value="voidpath"/></div></td>
				        <!--  时间 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center"><s:date name="createtime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="15%">
					    	<a href="javascript:loadVideoLink(${id});"><img alt="" src="res/images/Modification.png"/>【修改】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【删除】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="admin/vodVideoAction_browseVodvideoByVodprogramID.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div>
</s:if>
<s:if test="#session.language==2">
<div class="AlonModule">
     <div class="AlonModule_Top">
           <div class="AlonModule_Top1"><img  alt="" src="<%=basePath%>res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul> 
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action">【${sessionScope.vodpart.vodpartnamee}】List</a></li>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" >>>【${vodprogram.voidprogramnamee}】List</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     	
          <div class="AlonModule_list">
	                         
	           <s:form method="post" action="admin/vodVideoAction_browseVodvideoByVodprogramID.action" namespace="/admin" id="searchForm">
	           <div class="ProgramList_Search">
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	<s:hidden name="vodprogramid" id="vodprogramid" value="%{model.vodprogramid}"></s:hidden>
  									Name:
  									<s:textfield name="voidname" id="voidname" maxlength="50" style="margin-left:10px"></s:textfield>
  									<input type="submit" value="Search" class="Sear" style="margin-left:10px"/>
									<input type="button" value="Back" class="Sear" style="margin-left:10px" onclick="window.location.href='admin/vodProgram_viewVodprogram.action'"/>
	                         	</div>
	                         </div>
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground" >
	                              	 <a href="<%=basePath%>admin/vodVideoAction_skip.action?vodprogramid=${vodprogramid}"><img alt="" src="res/images/Gnome-List-Add-32.png"/> Add</a>
	                              	 <a href="javascript:void(delVideo());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           </s:form>
	           <s:form action="admin/vodVideoAction_macRead.action" namespace="/admin" method="post" enctype="multipart/form-data">
                  <input type="submit" class="right-button08" value="Import" onclick=" return macLead();" style="margin-left: 60px;margin-right:5px" />
		  		    <s:file name="xls" id="xls" size="40"></s:file>
		  		   <font style="color: red;size: 15px"><span id="error2"></span></font>
		  		   <s:if test="messge == 1"><span style="color:red;">Import success！</span></s:if>
		  		   <s:elseif test="messge == 2"><span style="color:red;">The import failed!Please check the format</span></s:elseif>
		  	   </s:form>
	           <div class="ContentInformation">
	                <table width="100%" class="table1">
					  <s:hidden name="vodprogramid" id="vodprogramid"></s:hidden>
					  <tr class="TableTitle">
					    <th scope="col" width="2%"><input type="checkbox" onclick="checkAll(this, 'checkCls')"/> </th>
						<th scope="col" width="23%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Name</div></th>
						<th scope="col" width="30%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Path</div></th>
						<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Release Time</div></th>	
						<th scope="col" width="15%" height="30" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Operation</div></th>		
					  </tr>
					  
					 <s:form namespace="/admin" action="vodVideoAction_delVodvideo.action" method="post" id="delForm" cssClass="delForm">
					  <s:iterator value="pageBean.elements" id="item" status="st">
					  <tr id="otd">
					    <!-- checkbox -->
				        <td width="2%" height="25" class="STYLE1" bgcolor="#EEEEEE" align="center"><input type="checkbox" class="checkCls" id="vedioid" name="vedioid" value="${id}"/></td> 
				        <!-- 视频名称 -->
				        <td width="23%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
				        <div align="center"><s:property value="voidnamee"/></div></td>
				        <!-- 地址 -->
				        <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center"><s:property value="voidpath"/></div></td>
				        <!--  时间 -->
				        <td width="15%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#EEEEEE"><div align="center"><s:date name="createtime" format="yyyy-MM-dd HH:mm:ss"/></div></td>
						<!-- 编辑 -->				    
					    <td class="Operating" nowrap="nowrap" width="15%">
					    	<a href="javascript:loadVideoLink(${id});"><img alt="" src="res/images/Modification.png"/>【Modify】</a>
					    	<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png"/>【Delete】</a>
					    </td>
					  </tr>
					  </s:iterator>
					  
					</s:form>
					
					<tr>
						<td colspan="5">
							<div>
							<jsp:include page="/jsp/page.jsp" flush="false">
								<jsp:param value="admin/vodVideoAction_browseVodvideoByVodprogramID.action" name="actionName"/>
							</jsp:include>
							</div>
						</td>
					</tr>
				 	</table>
			  </div>
			  
          </div>
     </div>
</div>
</s:if>
</body>
</html>


