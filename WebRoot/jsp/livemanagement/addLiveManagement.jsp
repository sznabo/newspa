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
<title>添加模拟直播管理</title>
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
var a = <%=session.getAttribute("language")%>
  function checkEmpty(){if(a==1){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("请输入频道名称");
		return false;
	}
	//验证频率
	if ($("#freq").val().trim() == '') {
		alert("请输入正确的频率（数字）");
		return false;
	}
	//验证频道顺序
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("请选择频道的顺序");
				return false;
			}
   }
  }
  if(a==2){
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("Please enter the channel name");
		return false;
	}
	//验证频率
	if ($("#freq").val().trim() == '') {
		alert("Please input the correct frequency (digital)");
		return false;
	}
	//验证频道顺序
	if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("Please select the order of the channel");
				return false;
			}
   }
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">模拟直播管理</a></li>
                      <li class="currentHover"><a>>>添加模拟直播信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="liveManagementAction_saveLiveMangement.action" namespace="/live" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="model.id" id="id"></s:hidden>
			<tr>
				<th scope="row" align="right">频道名称：</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">频率：</th>
				<td class="inp">
					<input maxlength="30" type="text" name="model.freq" id="freq" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">图像制式：</th>
				<td class="inp">
					<s:select list="#{'PAL':'PAL','PAL_60':'PAL_60','PAL_BGHI':'PAL_BGHI','PAL_M':'PAL_M','PAL_N':'PAL_N','AUTO':'AUTO','NTSC4.43':'NTSC4.43','NTSC3.58':'NTSC3.58','NTSC_44':'NTSC_44','NTSC_M':'NTSC_M','SECAM':'SECAM'}" name="model.zhishi" id="zhishi">
					</s:select>
					<!-- <input maxlength="30" type="text" name="model.zhishi" id="zhishi" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/> -->
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">伴音制式：</th>
				<td class="inp">
					<s:select list="#{'DK':'DK','I':'I','M':'M','B/G':'B/G','BG':'BG','L':'L','NUM':'NUM'}" name="model.radiozhishi" id="radiozhishi">
					</s:select>
					<!-- <input maxlength="30" type="text" name="model.zhishi" id="zhishi" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/> -->
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">顺序：</th>
				<td class="inp">
				<s:radio list="#{0:'最后一个', 1:'置于指定节目之前'}" id="positionType" value="0" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="liveManagementList" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.name} </div>  
							</s:iterator>
						</div>
					</td>
				</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" name="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" name="reset" value="重置" class="STYLE1"  />
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">Analog broadcast management</a></li>
                      <li class="currentHover"><a>>>Add analog broadcast information</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="liveManagementAction_saveLiveMangement.action" namespace="/live" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="model.id" id="id"></s:hidden>
			<tr>
				<th scope="row" align="right">Channel name:</th>
				<td class="inp">
					<input maxlength="30" size="60" type="text" name="model.name" id="name" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Frequency:</th>
				<td class="inp">
					<input maxlength="30" type="text" name="model.freq" id="freq" value="" /><font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Image formats:</th>
				<td class="inp">
					<s:select list="#{'PAL':'PAL','PAL_60':'PAL_60','PAL_BGHI':'PAL_BGHI','PAL_M':'PAL_M','PAL_N':'PAL_N','AUTO':'AUTO','NTSC4.43':'NTSC4.43','NTSC3.58':'NTSC3.58','NTSC_44':'NTSC_44','NTSC_M':'NTSC_M','SECAM':'SECAM'}" name="model.zhishi" id="zhishi">
					</s:select>
					<!-- <input maxlength="30" type="text" name="model.zhishi" id="zhishi" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/> -->
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Audio formats:</th>
				<td class="inp">
					<s:select list="#{'DK':'DK','I':'I','M':'M','B/G':'B/G','BG':'BG','L':'L','NUM':'NUM'}" name="model.radiozhishi" id="radiozhishi">
					</s:select>
					<!-- <input maxlength="30" type="text" name="model.zhishi" id="zhishi" value="" onkeyup="value=value.replace(/[^\d]/g,'')"/> -->
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Order:</th>
				<td class="inp">
				<s:radio list="#{0:'The last one', 1:'Placed in the designated program before'}" id="positionType" value="0" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="liveManagementList" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.name} </div>  
							</s:iterator>
						</div>
					</td>
				</tr>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" name="submit" value="submit" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" name="reset" value="reset" class="STYLE1"  />
				<input type="button" name="back" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
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

