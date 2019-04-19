<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	int i = 1;
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<base href="<%=basePath%>"></base>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>点播列表</title>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<style type="text/css">
</style>
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
	function addVodprogram() {
		var vodpartid = document.getElementById("vodpartid").value;
		window.location.href = "admin/vodProgramAction_skip.action?vodpartID="
				+ vodpartid + "&type=skip";
	}

	//删除节目列表（二级）
	function delVodprogramLink() {if(a==1){
		var count = 0;
		$(".checkCls").each(function(index, obj) {
			if (obj.checked) {
				count++;
			}
		});
		if (count == 0) {
			alert("请选择要删除的记录");
			return;
		}
		var r = window.confirm("确认要删除么?(如果产品已经在使用，则无法删除)");
		if (r) {
			$("#deleteForm").submit();
		}
	}
	if(a==2){
		var count = 0;
		$(".checkCls").each(function(index, obj) {
			if (obj.checked) {
				count++;
			}
		});
		if (count == 0) {
			alert("Please choose to delete records");
			return;
		}
		var r = window.confirm("Confirm to delete it?(if the product is already in use, it cannot be deleted)");
		if (r) {
			$("#deleteForm").submit();
		}
	}
	}

	//批量获得ID,供生成xml适用
	function gainIDs() {if(a==1){
		var obj = document.getElementsByName('vedioid');
		var ids = [];
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				var id = obj[i].value;
				ids.push(id);
			}
		}
		if (ids.length <= 0) {
			alert('请先选择！');
			return false;
		} else {
			location.href = "admin/vodManagement_loadVodProgramByID.action?vodid="
					+ ids;
		}
	}
	if(a==2){
		var obj = document.getElementsByName('vedioid');
		var ids = [];
		for ( var i = 0; i < obj.length; i++) {
			if (obj[i].checked == true) {
				var id = obj[i].value;
				ids.push(id);
			}
		}
		if (ids.length <= 0) {
			alert('Please choose！');
			return false;
		} else {
			location.href = "admin/vodManagement_loadVodProgramByID.action?vodid="
					+ ids;
		}
	}
	}

	function vodVideoSeries(id) {
		window.location.href = "admin/vodVideoAction_browseVodvideoByVodprogramID.action?model.vodprogramid="
				+ id;
	}

	function loadLiveLink(liveid) {
		window.location.href = "admin/liveManagement_loadLiveByID.action?liveid="
				+ liveid + "&type=modifyLive";
	}

	function loadVodprogramLink(id) {
		window.location.href = "admin/vodProgram_updateVodprogram.action?vodprogramID="
				+ id + "&type=editvodprogram";
	}

	function viewImg(vodprogramid) {
		window.location.href = "admin/vodProgramAction_viewImg.action?vodprogramID="
				+ vodprogramid + "&type=viewImg";
	}
	function delBatch() {if(a==1){
		if (window.confirm("确定要删除吗?")) {
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			//var idList = document.getElementsByName("idList");
			//location.href = "admin/vodPartAction_delVodPartByIDs.action?idList=" + idList;
			document.getElementById("delForm").submit();
		}
	}
	}
	function del(id) {if(a==1){
		if (window.confirm("确定要删除吗?")) {
			window.location.href = "admin/vodProgram_delVodprogram.action?idList="
					+ id;
		}
	}
	if(a==2){
		if (window.confirm("Sure you want to delete?")) {
			window.location.href = "admin/vodProgram_delVodprogram.action?idList="
					+ id;
		}
	}
	}
	
   function macLead(){
		var xls = document.getElementById('xls').value;
		if(xls!=null&&xls.replace(/\s/g,"")!=""){
			var type = xls.split(".");
			if(type[1]=='xls'){
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
</script>

</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0"
	marginwidth="0" marginheight="0">
	<s:if test="#session.language==1">
	<div class="AlonModule">
		<div class="AlonModule_Top">
			<div class="AlonModule_Top1">
				<img alt="" src="<%=basePath%>res/images/TopColumn1.png" />
			</div>
			<div class="AlonModule_Top2">
				<ul>
					<li><a style="white-space: nowrap;"
						href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a>
					</li>
					<li class="currentHover"><a style="white-space: nowrap;">>>【${sessionScope.vodpart.vodpartname}】列表</a>
					</li>
					
				</ul>
			</div>
			<div class="AlonModule_Top3">
				<img alt="" src="<%=basePath%>res/images/TopColumn3.png" />
			</div>
		</div>
		<div class="AlonModule_Body">

			<div class="AlonModule_list">

				<s:form method="post" action="admin/vodProgram_viewVodprogram.action" namespace="/admin" id="searchForm">
					<div class="ProgramList_Search">
						<div class="Search">
						<div class="add_darImg1"></div>
						<div class="add_darBackground" style="background:#EEEEEE;">
						<s:hidden name="vodpartID"></s:hidden>
						名称: <input type="text" name="model.voidprogramname"
									id="voidprogramname" maxlength="255" style="margin-left:10px" />&nbsp;&nbsp;
									类型：<s:select name="model.types" list="#{0:'电视剧',1:'电影'}" headerKey="" headerValue="全部"></s:select>
								<!-- 导演: <input type="text" name="model.voidprogramdirector"
									id="voidprogramdirector" maxlength="255"
									style="margin-left:10px" />&nbsp;&nbsp; 主演: <input type="text"
									name="model.voidprogramstarring" id="voidprogramstarring"
									maxlength="255" style="margin-left:10px" />  -->
					<input type="submit" value="搜&nbsp;索" class="Sear" style="margin-left:10px" /> 
					<input type="button" value="返&nbsp;回" class="Sear" style="margin-left:10px" onclick="window.location.href='admin/vodPartAction_listVodPart.action'" />
                
							</div>
						</div>

						<div class="add_dar" style="margin-right:10px;">
							<div class="add_darImg1">
								<img src="res/images/icons_01.png" />
							</div>
							<div class="add_darBackground">
								<a
									href="<%=basePath%>admin/vodProgram_skip.action?vodpartID=${vodpartID}"><img
									alt="" src="res/images/Gnome-List-Add-32.png" /> 添加</a> <a
									href="javascript:void(delBatch());"><img alt=""
									src="res/images/Gnome-Window-Close-32.png" /> 删除</a>
							</div>
							<div class="add_darImg2">
								<img width="15" src="res/images/icons_03.png" />
							</div>
						</div>
					</div>
				</s:form>
				  <s:form action="admin/vodProgram_macRead.action" namespace="/admin" method="post" enctype="multipart/form-data">
                  <input type="submit" class="right-button08" value="批量导入" onclick=" return macLead();" style="margin-left: 60px;margin-right:5px" />
		  		    <s:file name="xls" id="xls" size="40"></s:file>
		  		   <font style="color: red;size: 15px"><span id="error2"></span></font>
		  		   <s:if test="messge == 1"><span style="color:red;">导入成功！</span></s:if>
		  		   <s:elseif test="messge == 2"><span style="color:red;">导入失败！请检查格式</span></s:elseif>
		  		   </s:form>
				<div class="ContentInformation">
					<table width="100%" class="table1">
						<tr class="TableTitle">
							   <th scope="col" width="2%"><input type="checkbox"
								onclick="checkAll(this, 'checkCls')" /></th>
							   <th scope="col" width="20%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">名称</th>
								
						       <th scope="col" width="10%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">国家/地区</th> 
								<th scope="col" width="10%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">类型</th>
							   <!-- 
							    <th scope="col" width="5%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">年份</th>  
							    <th scope="col" width="15%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">导演</th> 
							    <th scope="col" width="20%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">主演</th>  
							    <th scope="col" width="20%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">点播广告</th>-->
							    <th scope="col" width="27%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">操作</th>
						</tr>

						<s:form namespace="/admin"
							action="admin/vodProgram_delVodprogram.action" method="post"
							id="delForm" cssClass="delForm">
							<s:hidden name="model.vodpartid" id="vodpartid"></s:hidden>
							<s:iterator value="pageBean.elements" id="item" status="st">
							
								<tr id="otd">
									<!-- checkbox -->
									<td height="25" class="STYLE1" bgcolor="#EEEEEE" align="center"><input
										type="checkbox" class="checkCls" name="idList" value="${id}" />
									</td>
									<!-- 节目名称 -->
									<td height="25" class="STYLE1" nowrap="nowrap" align="center"
										bgcolor="#EEEEEE">
										<div align="center" style="width:180px; overflow:hidden; padding-left:50px; text-overflow:ellipsis; white-space:nowrap;">
											<s:if test="types==0"><a style="color:blue;"
												href="javascript:vodVideoSeries(${id});">
												<s:property value="voidprogramname" />
											</a> </s:if>
											<s:else><s:property value="voidprogramname" /></s:else>
											
										</div>
									</td>
									
								
									<!-- 国家地区 -->
									 <td height="25" class="STYLE1" nowrap="nowrap" align="center"
										bgcolor="#EEEEEE"><div align="center">
											<s:property value="area" />
										</div>
									</td> 

									<!-- 类型 -->
									 <td height="25" class="STYLE1" nowrap="nowrap" align="center"
										bgcolor="#EEEEEE"><div align="center">
											<s:property value="filmtype" />
										</div>
									</td> 

									
									<!--操作 -->
									<td height="25" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
										<%-- <a href="<%=basePath%>addetail/list.action?adDetail.adid=${item.adid}"><img alt="" src="res/images/viewShopIntroduce.png"/>【图片|视频】</a> --%>
										<a href="javascript:loadVodprogramLink(${item.id});"><img alt="" src="res/images/Modification.png" border="none;"/>【修改】</a>
										<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png" border="none;"/>【删除】</a>
									</td>
								</tr>
							</s:iterator>

						</s:form>

						<tr>
							<td colspan="8">
								<div>
									<jsp:include page="/jsp/page.jsp" flush="false">
										<jsp:param value="admin/vodProgram_viewVodprogram.action"
											name="actionName" />
									</jsp:include>
								</div></td>
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
			<div class="AlonModule_Top1">
				<img alt="" src="<%=basePath%>res/images/TopColumn1.png" />
			</div>
			<div class="AlonModule_Top2">
				<ul>
					<li><a style="white-space: nowrap;"
						href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a>
					</li>
					<li class="currentHover"><a style="white-space: nowrap;">>>【${sessionScope.vodpart.vodpartnamee}】 List</a>
					</li>
					
				</ul>
			</div>
			<div class="AlonModule_Top3">
				<img alt="" src="<%=basePath%>res/images/TopColumn3.png" />
			</div>
		</div>
		<div class="AlonModule_Body">

			<div class="AlonModule_list">

				<s:form method="post" action="admin/vodProgram_viewVodprogram.action" namespace="/admin" id="searchForm">
					<div class="ProgramList_Search">
						<div class="Search">
						<div class="add_darImg1"></div>
						<div class="add_darBackground" style="background:#EEEEEE;">
						<s:hidden name="vodpartID"></s:hidden>
						name: <input type="text" name="model.voidprogramname"
									id="voidprogramname" maxlength="255" style="margin-left:10px" />&nbsp;&nbsp;
									Type：<s:select name="model.types" list="#{0:'TV series',1:'movie'}" headerKey="" headerValue="all"></s:select>
					<input type="submit" value="Search" class="Sear" style="margin-left:10px" /> 
					<input type="button" value="Back" class="Sear" style="margin-left:10px" onclick="window.location.href='admin/vodPartAction_listVodPart.action'" />
                
							</div>
						</div>

						<div class="add_dar" style="margin-right:10px;">
							<div class="add_darImg1">
								<img src="res/images/icons_01.png" />
							</div>
							<div class="add_darBackground">
								<a
									href="<%=basePath%>admin/vodProgram_skip.action?vodpartID=${vodpartID}"><img
									alt="" src="res/images/Gnome-List-Add-32.png" />Add</a> <a
									href="javascript:void(delBatch());"><img alt=""
									src="res/images/Gnome-Window-Close-32.png" />Delete</a>
							</div>
							<div class="add_darImg2">
								<img width="15" src="res/images/icons_03.png" />
							</div>
						</div>
					</div>
				</s:form>
				  <s:form action="admin/vodProgram_macRead.action" namespace="/admin" method="post" enctype="multipart/form-data">
                  <input type="submit" class="right-button08" value="Import" onclick=" return macLead();" style="margin-left: 60px;margin-right:5px" />
		  		    <s:file name="xls" id="xls" size="40"></s:file>
		  		   <font style="color: red;size: 15px"><span id="error2"></span></font>
		  		   <s:if test="messge == 1"><span style="color:red;">Import success！</span></s:if>
		  		   <s:elseif test="messge == 2"><span style="color:red;">The import failed!Please check the format</span></s:elseif>
		  		   </s:form>
				<div class="ContentInformation">
					<table width="100%" class="table1">
						<tr class="TableTitle">
							   <th scope="col" width="2%"><input type="checkbox"
								onclick="checkAll(this, 'checkCls')" /></th>
							   <th scope="col" width="20%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">name</th>
								
						       <th scope="col" width="10%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">Country/region</th> 
								<th scope="col" width="10%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">type</th>
							   <!-- 
							    <th scope="col" width="5%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">年份</th>  
							    <th scope="col" width="15%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">导演</th> 
							    <th scope="col" width="20%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">主演</th>  
							    <th scope="col" width="20%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">点播广告</th>-->
							    <th scope="col" width="27%" height="30" class="STYLE1"
								nowrap="nowrap" bgcolor="#EEEEEE">Operation</th>
						</tr>

						<s:form namespace="/admin"
							action="admin/vodProgram_delVodprogram.action" method="post"
							id="delForm" cssClass="delForm">
							<s:hidden name="model.vodpartid" id="vodpartid"></s:hidden>
							<s:iterator value="pageBean.elements" id="item" status="st">
							
								<tr id="otd">
									<!-- checkbox -->
									<td height="25" class="STYLE1" bgcolor="#EEEEEE" align="center"><input
										type="checkbox" class="checkCls" name="idList" value="${id}" />
									</td>
									<!-- 节目名称 -->
									<td height="25" class="STYLE1" nowrap="nowrap" align="center"
										bgcolor="#EEEEEE">
										<div align="center" style="width:180px; overflow:hidden; padding-left:50px; text-overflow:ellipsis; white-space:nowrap;">
											<s:if test="types==0"><a style="color:blue;"
												href="javascript:vodVideoSeries(${id});">
												<s:property value="voidprogramnamee" />
											</a> </s:if>
											<s:else><s:property value="voidprogramnamee" /></s:else>
											
										</div>
									</td>
									
								
									<!-- 国家地区 -->
									 <td height="25" class="STYLE1" nowrap="nowrap" align="center"
										bgcolor="#EEEEEE"><div align="center">
											<s:property value="area" />
										</div>
									</td> 

									<!-- 类型 -->
									 <td height="25" class="STYLE1" nowrap="nowrap" align="center"
										bgcolor="#EEEEEE"><div align="center">
											<s:property value="filmtype" />
										</div>
									</td> 

									
									<!--操作 -->
									<td height="25" nowrap="nowrap" align="center" bgcolor="#EEEEEE">
										<%-- <a href="<%=basePath%>addetail/list.action?adDetail.adid=${item.adid}"><img alt="" src="res/images/viewShopIntroduce.png"/>【图片|视频】</a> --%>
										<a href="javascript:loadVodprogramLink(${item.id});"><img alt="" src="res/images/Modification.png" border="none;"/>【Modify】</a>
										<a href="javascript:void(del(${item.id}));"><img alt="" src="res/images/Delete.png" border="none;"/>【Delete】</a>
									</td>
								</tr>
							</s:iterator>

						</s:form>

						<tr>
							<td colspan="8">
								<div>
									<jsp:include page="/jsp/page.jsp" flush="false">
										<jsp:param value="admin/vodProgram_viewVodprogram.action"
											name="actionName" />
									</jsp:include>
								</div></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		</div>
		</s:if>
</body>
</html>


