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
<link rel="stylesheet" href="<%=basePath%>res/js/jquery_tree/jquery.treeview.css" />
<link rel="stylesheet" href="<%=basePath %>res/css/style/common.css" type="text/css" />

<style type="text/css">
body {
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

</style>

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
  function checkEmpty(){
  if(a==1){
	  if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("请选择节目的顺序");
				return false;
			}
   }

	if ($("#voidprogramname").val().trim() == '') {
		alert("请输入名称");
		return false;
	}

	if ($("#year").val().trim() == '') {
		alert("请输入年份");
		return false;
	} else if($("#year").val().length!=4 || !Is_positive_num($("#year").val())) {
		alert("请输入正确的年份");
		return false;
	}
	

	if ($("#filmtype").val().trim() == '') {
		alert("请输入类型");
		return false;
	}


	if ($("#area").val().trim() == '') {
		alert("请输入国家/地区");
		return false;
	}

	if ($("#voidprogramimg").val().trim() == '') {
		alert("请选择图片");
		return false;
	}
	if ($("#types1").attr("checked")) {
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
  	}
	if ($("#voidprogramdescription").val().length>255) {
		alert("描述不能大于255个字");
		return false;
	}
	return true;
  }
  if(a==2){
	  if ($("#positionType1").attr("checked")) {
			var isSelect = false;
			$("input[name='model.position']").each(function(){
			    if (this.checked) {
			    	isSelect = true;
			    }
			});
			if (!isSelect) {
				alert("Please select a program of the order");
				return false;
			}
   }

	if ($("#voidprogramname").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}

	if ($("#year").val().trim() == '') {
		alert("Please enter the year");
		return false;
	} else if($("#year").val().length!=4 || !Is_positive_num($("#year").val())) {
		alert("Please input the correct year");
		return false;
	}
	

	if ($("#filmtype").val().trim() == '') {
		alert("Please enter the type");
		return false;
	}


	if ($("#area").val().trim() == '') {
		alert("Please enter the country/region");
		return false;
	}

	if ($("#voidprogramimg").val().trim() == '') {
		alert("Please select a picture");
		return false;
	}
	if ($("#types1").attr("checked")) {
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
  	}
	if ($("#voidprogramdescription").val().length>255) {
		alert("Description is not greater than 255 characters");
		return false;
	}
	return true;
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
  
   function showvideoPlay() {
	  if ($("#types1").attr("checked")) {
		  $("#vedioPlay").show();
	  } else {
		  $("#vedioPlay").hide();
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
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodPartAction_listVodPart.action?type=goListVodPart">影片管理</a></li>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action">【${sessionScope.vodpart.vodpartname}】列表</a></li>
                      <li class="currentHover"><a> >>添加影片信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="vodProgram_saveVodProgram.action" enctype="multipart/form-data" namespace="/admin" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="vodpartid" id="vodpartid" value="%{model.vodpartid}"></s:hidden>
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
				<s:textfield name="voidprogramname" size="60" id="voidprogramname" maxlength="30"></s:textfield>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			 <tr>
				<th scope="row" align="right">年份：</th>
				<td class="inp">
					<s:textfield name="year" id="year" maxlength="4" value="2019"></s:textfield>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr> 
			<tr>
				<th scope="row" align="right">类型：</th>
				<td class="inp">
					<div style="position:relative;">
							<span  style="margin-left:100px;width:18px;overflow:hidden;">
							<s:select style="margin-left:-100px;width:124px;" list="typeList" cssClass="typeCls"  headerKey="-9999"  onclick="if (this.value!=-9999){document.getElementById('filmtype').value=this.value;}" />
							</span><font style="color: red">&nbsp;*</font>
							<input name="filmtype" id="filmtype"  class="text" style="width:100px;position:absolute;left:0px;bottom: 5px;height:19px;" value="${typeList[0]}"/>
					</div>
				</td>
			</tr>
			 <tr>
				<th scope="row" align="right">国家/地区：</th>
				<td  class="inp">
					<div style="position:relative;">
						<span  style="margin-left:100px;width:18px;overflow:hidden;">
						<s:select style="margin-left:-100px;width:124px;" list="areaList" cssClass="areaCls" headerKey="-9999"  onclick="if (this.value!=-9999){document.getElementById('area').value=this.value;}" />
						</span><font style="color: red">&nbsp;*</font>
						<input name="area" id="area"  class="text" style="width:100px;position:absolute;left:0px; bottom: 5px;height:19px;" value="${areaList[0] }"/>
					</div>
						 
				</td>
			</tr> 
			 <tr>
				<th scope="row" align="right">主演：</th>
				<td  class="inp">
					<s:textfield name="voidprogramstarring" id="voidprogramstarring" maxlength="50" size="40px"></s:textfield>
				</td>
			</tr> 
			 <tr>
					<th scope="row" align="right">导演：</th>
					<td  class="inp">
					<s:textfield name="voidprogramdirector" id="voidprogramdirector" maxlength="30"  size="40px"></s:textfield>
					<span><font style="color: red">&nbsp;</font></span></td>
				</tr> 
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<s:file name="img" id="voidprogramimg" size="70px" ></s:file>
					<font style="color: red; margin-left: 10">*</font>
					注：图片分辨率207px * 308px
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">点播广告：</th>
				<td class="inp">
					<s:select list="adList" name="model.adid" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				</td>
			</tr> 
		   <tr>
					<th scope="row" align="right">类型：</th>
					<td valign="top" class="inp">
						<s:radio list="#{ 1:'电影',0:'电视剧'}" id="types" value="1" name="types" cssClass="positionType" onclick="showvideoPlay();"></s:radio>
					</td>
		   </tr>	
				
			<tr id="vedioPlay" style="">
				<th scope="row" align="right" style="float: right;border: none;">文件路径：</th>
				<td class="inp">
					<div style="height: 300px;width:500px;overflow: auto;">
						<table>
						<s:iterator value="videoFileList" id="v">
							<tr>
								<td>
								<input type="radio" name="voidpath" value="${v}"/>${v}
								</td>
							</tr>
						</s:iterator>
						</table>
					</div>
					<!-- <font style="color: red; margin-left: 10">*</font> -->
				</td>
			</tr>
			
			<tr>
					<th scope="row" align="right">顺序：</th>
					<td valign="top" class="inp">
						<s:radio list="#{ 1:'置于指定节目之前',0:'最后一个'}" id="positionType" value="1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					</td>
		   </tr>
		   <tr id="LiveListTr" style="">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="vodprogramlist" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}"  />${st.index+1}、${item.voidprogramname} </div>  
							</s:iterator>
						</div>
					</td>
			</tr>
			<tr>
					<th scope="row" align="right">描述：</th>
					<td class="inp"><s:textarea name="voidprogramdescription" id="voidprogramdescription" cols="80" rows="5" ></s:textarea></td>
			</tr> 
								
									
				
		
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
			<input type="reset" value="重置" class="STYLE1"  />
			<input type="button" value="返回" class="STYLE1" onclick="window.history.go(-1);"/>
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
                      <li><a style="white-space: nowrap;" href="<%=basePath%>admin/vodProgram_viewVodprogram.action">【${sessionScope.vodpart.vodpartnamee}】List</a></li>
                      <li class="currentHover"><a> >>Add Video</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body">
	 <div class="AlonModule_list">
	 <s:form action="vodProgram_saveVodProgram.action" enctype="multipart/form-data" namespace="/admin" method="post">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		<s:hidden name="vodpartid" id="vodpartid" value="%{model.vodpartid}"></s:hidden>
			<tr>
				<th scope="row" align="right">name：</th>
				<td class="inp">
				<s:textfield name="voidprogramnamee" size="60" id="voidprogramname" maxlength="30"></s:textfield>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr>
			 <tr>
				<th scope="row" align="right">year：</th>
				<td class="inp">
					<s:textfield name="year" id="year" maxlength="4"></s:textfield>
					<font style="color: red; margin-left: 10">*</font>
				</td>
			</tr> 
			<tr>
				<th scope="row" align="right">type：</th>
				<td class="inp">
					<div style="position:relative;">
							<span  style="margin-left:100px;width:18px;overflow:hidden;">
							<s:select style="margin-left:-100px;width:124px;" list="typeList" cssClass="typeCls"  headerKey="-9999"  onclick="if (this.value!=-9999){document.getElementById('filmtype').value=this.value;}" />
							</span><font style="color: red">&nbsp;*</font>
							<input name="filmtype" id="filmtype"  class="text" style="width:100px;position:absolute;left:0px;bottom: 5px;height:19px;" value=""/>
					</div>
				</td>
			</tr>
			 <tr>
				<th scope="row" align="right">Country/region：</th>
				<td  class="inp">
					<div style="position:relative;">
						<span  style="margin-left:100px;width:18px;overflow:hidden;">
						<s:select style="margin-left:-100px;width:124px;" list="areaList" cssClass="areaCls" headerKey="-9999"  onclick="if (this.value!=-9999){document.getElementById('area').value=this.value;}" />
						</span><font style="color: red">&nbsp;*</font>
						<input name="area" id="area"  class="text" style="width:100px;position:absolute;left:0px; bottom: 5px;height:19px;" />
					</div>
						 
				</td>
			</tr> 
			 <tr>
				<th scope="row" align="right">starring：</th>
				<td  class="inp">
					<s:textfield name="voidprogramstarring" id="voidprogramstarring" maxlength="50" size="40px"></s:textfield>
				</td>
			</tr> 
			 <tr>
					<th scope="row" align="right">The director：</th>
					<td  class="inp">
					<s:textfield name="voidprogramdirector" id="voidprogramdirector" maxlength="30"  size="40px"></s:textfield>
					<span><font style="color: red">&nbsp;</font></span></td>
				</tr> 
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<s:file name="img" id="voidprogramimg" size="70px" ></s:file>
					<font style="color: red; margin-left: 10">*</font>
					Note: the image resolution207px * 308px
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">On demand of advertising：</th>
				<td class="inp">
					<s:select list="adList" name="model.adid" id="leftContent" headerKey="" headerValue="Please select a..." cssStyle="height:22px;"  listKey="id" listValue="name" />
				</td>
			</tr> 
		   <tr>
					<th scope="row" align="right">Type:</th>
					<td valign="top" class="inp">
						<s:radio list="#{0:'TV series', 1:'The movie'}" id="types" value="0" name="types" cssClass="positionType" onclick="showvideoPlay();"></s:radio>
					</td>
		   </tr>	
				
			<tr id="vedioPlay" style="display:none">
				<th scope="row" align="right" style="float: right;border: none;">The file path:</th>
				<td class="inp">
					<div style="height: 300px;width:500px;overflow: auto;">
						<table>
						<s:iterator value="videoFileList" id="v">
							<tr>
								<td>
								<input type="radio" name="voidpath" value="${v}"/>${v}
								</td>
							</tr>
						</s:iterator>
						</table>
					</div>
					<!-- <font style="color: red; margin-left: 10">*</font> -->
				</td>
			</tr>
			
			<tr>
					<th scope="row" align="right">Order:</th>
					<td valign="top" class="inp">
						<s:radio list="#{0:'The last one', 1:'Placed in the designated program before'}" id="positionType" value="0" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
					</td>
		   </tr>
		   <tr id="LiveListTr" style="display: none;">
					<td>&nbsp;</td>
					<td valign="top">
						<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
							<s:iterator value="vodprogramlist" id="item" status="st">
								 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.voidprogramname} </div>  
							</s:iterator>
						</div>
					</td>
			</tr>
			<tr>
					<th scope="row" align="right">describe：</th>
					<td class="inp"><s:textarea name="voidprogramdescription" id="voidprogramdescription" cols="80" rows="5" ></s:textarea></td>
			</tr> 
								
									
				
		
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="submit" onclick="return checkEmpty()" class="STYLE1" />
			<input type="reset" value="reset" class="STYLE1"  />
			<input type="button" value="return" class="STYLE1" onclick="window.history.go(-1);"/>
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

