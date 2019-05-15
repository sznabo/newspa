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
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<link rel="stylesheet" href="<%=basePath %>res/css/style/common.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<script language="JavaScript" src="<%=basePath %>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>res/js/jquery-1.3.2.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script src="<%=basePath%>res/js/jquery.filestyle.js"  type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>res/js/my97datepicker/WdatePicker.js" defer="defer"></script>
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
  function checkEmpty(){if(a==1){
  	var name = document.getElementById('voidname').value.trim();
  	var addres = document.getElementById('voidpath').value.trim();
  	var vodprogramid = document.getElementById("vodprogramid").value;

  	if (name =="") {
  	  	alert("请输入名称");
  	  	return false;
  	}
	
	var selectV = false;
  	$("input[name='voidpath']").each(function(){
		    if (this.checked) {
		    	selectV = true;
		    }
	});
  	if(!selectV) {
  		alert("请选择文件");
  		return false;
  	}
  	
  	if ($("#positionType1").attr("checked")) {
  		var isSelect = false;
  		$("input[name='model.position']").each(function(){
  		    if (this.checked) {
  		    	isSelect = true;
  		    }
  		});
  		if (!isSelect) {
  			alert("请选择视频的顺序");
  			return false;
  		}
  	}
  }
  if(a==2){
  	var name = document.getElementById('voidname').value.trim();
  	var addres = document.getElementById('voidpath').value.trim();
  	var vodprogramid = document.getElementById("vodprogramid").value;

  	if (name =="") {
  	  	alert("Please enter a name");
  	  	return false;
  	}
	
	var selectV = false;
  	$("input[name='voidpath']").each(function(){
		    if (this.checked) {
		    	selectV = true;
		    }
	});
  	if(!selectV) {
  		alert("Please select a file");
  		return false;
  	}
  	
  	if ($("#positionType1").attr("checked")) {
  		var isSelect = false;
  		$("input[name='model.position']").each(function(){
  		    if (this.checked) {
  		    	isSelect = true;
  		    }
  		});
  		if (!isSelect) {
  			alert("Please select a video sequence");
  			return false;
  		}
  	}
  }
  }
  function selectRosService(val){
  	var checknum = val.value;
  	if(checknum==1){
  		document.getElementById("subtree").style.display="";
  	}else{
  		document.getElementById("subtree").style.display="none";
  	}
  }
  
  function showLiveList() {
		if ($("#positionType1").attr("checked")) {
			  $("#LiveListTr").show();
		} else {
			  $("#LiveListTr").hide();
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
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">点播栏目管理</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action?type=goListVodPart">【${sessionScope.vodpart.vodpartname}】节目列表</a></li>
                      <li>&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" onclick="window.history.go(-1);">【${vodprogram.voidprogramname}】节目剧集系列</a></li>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" >>>修改【${model.voidname}】节目续集</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="vodVideoAction_updateSave" namespace="/admin" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="vodprogramid" id="vodprogramid" value="%{model.vodprogramid}"></s:hidden>
				<s:hidden name="model.id" id="id" value="%{model.id}"></s:hidden>
			<tr>
				<th scope="row" align="right">视频名称：</th>
				<td class="inp">
					<s:textfield name="model.voidname" id="voidname" maxlength="50"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right" style="float: right;border: none;">文件路径：</th>
				<td class="inp">
					<div style="height: 300px;width:500px;overflow: auto;">
					<table>
					<s:iterator value="videoFileList" id="v">
						<tr>
							<td>
							<input <s:if test="model.voidpath == #v">checked="checked"</s:if>  type="radio" name="voidpath" value="${v}"/>${v}
							</td>
						</tr>
					</s:iterator>
					</table>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">顺序：</th>
				<td class="inp">
				<s:radio list="#{-1:'不变', 0:'最后一个', 1:'置于指定节目之前'}" id="positionType" value="-1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="vodvideoList" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.voidname} </div>  
							</s:iterator>
						</div>
					</td>
				</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit"  value="提交" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset"  value="重置" class="STYLE1"  />
				<input type="button" name="back" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
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
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2">
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">Demand</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action?type=goListVodPart">【${sessionScope.vodpart.vodpartnamee}】List</a></li>
                      <li>&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" onclick="window.history.go(-1);">【${vodprogram.voidprogramnamee}】Show Series</a></li>
                      <li class="currentHover">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="white-space: nowrap;" >>>Modify ${model.voidnamee}</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="vodVideoAction_updateSave.action" namespace="/admin" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="vodprogramid" id="vodprogramid" value="%{model.vodprogramid}"></s:hidden>
				<s:hidden name="model.id" id="id" value="%{model.id}"></s:hidden>
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<s:textfield name="model.voidnamee" id="voidname" maxlength="50"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right" style="float: right;border: none;">Path:</th>
				<td class="inp">
					<div style="height: 300px;width:500px;overflow: auto;">
					<table>
					<s:iterator value="videoFileList" id="v">
						<tr>
							<td>
							<input <s:if test="model.voidpath == #v">checked="checked"</s:if>  type="radio" name="voidpath" value="${v}"/>${v}
							</td>
						</tr>
					</s:iterator>
					</table>
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Order:</th>
				<td class="inp">
				<s:radio list="#{-1:'The same', 0:'The last one', 1:'Placed in the designated program before'}" id="positionType" value="-1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="vodvideoList" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.voidname} </div>  
							</s:iterator>
						</div>
					</td>
				</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit"  value="Submit" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset"  value="Reset" class="STYLE1"  />
				<input type="button" name="back" value="Back" class="STYLE1" onclick="window.history.go(-1);"/>
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

