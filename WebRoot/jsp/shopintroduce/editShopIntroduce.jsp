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
<script language="JavaScript" src="<%=basePath %>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath %>res/js/jquery-1.3.2.min.js"></script>



<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/lib/jquery.cookie.js"></script>
<script  language="JavaScript"  src="<%=basePath%>res/js/jquery_tree/jquery.treeview.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/ckeditor/ckeditor.js"></script>
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
  	var shigongcanba = document.getElementById("shigongcanba").value;
  	//alert("shigongcanba"+shigongcanba);
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("请输入名称");
		return false;
	}
	if ($("#leftContent").val().trim() == '' && shigongcanba != 1 && shigongcanba != 2 &&shigongcanba != 3&&shigongcanba != 4) {
		alert("选择左侧内容");
		return false;
	}
	if(shigongcanba != 1 || shigongcanba != 2 || shigongcanba != 3 || shigongcanba != 4 || shigongcanba==''){
		//验证描述信息
		//applicationform是ckeditor的id或者名字
	    var val = CKEDITOR.instances.description.getData();
	    if (val.length == 0)
	    {
	       alert("请输入描述信息");
	       return false;
	    }else if(val.length > 5000){
	   
	    	alert("描述信息不能大于5000个字");
			return false;
	    }
	}
	
    return true;
  }
  if(a==2){
  	var shigongcanba = document.getElementById("shigongcanba").value;
  	//alert("shigongcanba"+shigongcanba);
  	//验证频道名称
  	if ($("#name").val().trim() == '') {
		alert("Please enter a name");
		return false;
	}
	if ($("#leftContent").val().trim() == '' && shigongcanba != 1 && shigongcanba != 2 &&shigongcanba != 3&&shigongcanba != 4) {
		alert("Selecting the content");
		return false;
	}
	if(shigongcanba != 1 || shigongcanba != 2 || shigongcanba != 3 || shigongcanba != 4 || shigongcanba==''){
		//验证描述信息
		//applicationform是ckeditor的id或者名字
	    var val = CKEDITOR.instances.descriptione.getData();
	    if (val.length == 0)
	    {
	       alert("Please enter a description");
	       return false;
	    }else if(val.length > 5000){
	   
	    	alert("Description is not greater than 5000 characters");
			return false;
	    }
	}
	
    return true;
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
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">自助服务</a></li>
                      <li class="currentHover"><a>>>修改自助服务信息</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="shopIntroduceAction_updateShopIntroduce.action" namespace="/shopintroduce" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		
		<s:if test="#session.lv == 2">
			<s:hidden name="model.parentID"></s:hidden>
			<input type="hidden" name="model.lv" value="2"/>
			 <s:hidden name="model.id" id="shigongcanba"></s:hidden> 
		</s:if>
		<s:else>
			<s:hidden name="model.lv"></s:hidden>
			<s:hidden name="model.id" id="shigongcanba"></s:hidden>
		</s:else>
		
			<tr>
				<th scope="row" align="right">名称：</th>
				<td class="inp">
					<s:textfield maxlength="30" size="60" name="model.name" id="name"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">图片：</th>
				<td class="inp">
					<s:file name="logo_img" id="logo" size="70px" ></s:file>
					<span>
						<img align="middle" width="200" height="100" src="<%=basePath%>${model.logo}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(不选择图片表示不更换)	<!-- 注：图片分辨率330px * 527px -->	
					<%-- <s:if test="#session.lv == 1">
					注：图片分辨率330px * 527px
					</s:if>
					
					<s:if test="#session.lv == 2"> --%>
					注：图片分辨率407px * 259px
					<%-- </s:if>	 --%>
				</td>
			</tr>
			<s:if test="#session.newFalg == 0">
				<tr>
					<th scope="row" align="right">左侧内容：</th>
					<td class="inp">
						<s:select list="adList" name="model.adid" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
					</td>
				</tr>
				<tr>
						<th scope="row" align="right">顺序：</th>
						<td valign="top" class="inp">
							<s:radio list="#{-1:'不变', 0:'最后一个', 1:'置于指定节目之前'}" id="positionType" value="-1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
						</td>
					</tr>
					
					<tr id="LiveListTr" style="display: none;">
						<td>&nbsp;</td>
						<td valign="top">
							<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
								<s:iterator value="shopintroducelist" id="item" status="st">
									 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.name} </div>  
								</s:iterator>
							</div>
						</td>
					</tr>
				<tr>
					<th scope="row" align="right">描述信息：</th>
					<td class="inp">
						<s:textarea name="model.description" id="description"></s:textarea>
						<script type="text/javascript">CKEDITOR.replace('model.description',{toolbar : 'MyToolbar'});</script>
					注：描述字符不能大于五千个字
					</td>
				</tr>
			</s:if>	
			<s:else>
				<tr style="display:none;">
					<th scope="row" align="right">左侧内容：</th>
					<td class="inp">
					<s:hidden name="model.adid" id="adid"></s:hidden>
						<!-- <s:select list="adList" name="model.adid" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" /> -->
					</td>
				</tr>
				<tr style="display:none;">
						<th scope="row" align="right">顺序：</th>
						<td valign="top" class="inp">
							<s:radio list="#{-1:'不变', 0:'最后一个', 1:'置于指定节目之前'}" id="positionType" value="-1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
						</td>
					</tr>
					
					<tr id="LiveListTr" style="display: none;">
						<td>&nbsp;</td>
						<td valign="top">
							<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
								<s:iterator value="shopintroducelist" id="item" status="st">
									 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.name} </div>  
								</s:iterator>
							</div>
						</td>
					</tr>
				<tr style="display:none;">
					<th scope="row" align="right">描述信息：</th>
					<td class="inp">
						<s:textarea name="model.description" id="description"></s:textarea>
						<script type="text/javascript">CKEDITOR.replace('model.description',{toolbar : 'MyToolbar'});</script>
					注：描述字符不能大于五千个字
					</td>
				</tr>
			</s:else>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="提交" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" value="重置" class="STYLE1"  />
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
<div class="AlonModule" >
     <div class="AlonModule_Top" >
           <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
           <div class="AlonModule_Top2" >
                 <ul>
                      <li><a style="white-space: nowrap;" href="<%=basePath%>shopintroduce/shopIntroduceAction_home.action">Service</a></li>
                      <li class="currentHover"><a>>>Modify</a></li>
                 </ul>
           </div>
           <div class="AlonModule_Top3" ><img alt="" src="res/images/TopColumn3.png"/></div>
     </div>
	 <div class="AlonModule_Body" style="overflow:hidden;">
	 <div class="AlonModule_list" >
	 <s:form action="shopIntroduceAction_updateShopIntroduce.action" namespace="/shopintroduce" method="post" enctype="multipart/form-data">
     <div class="AlonModule_Body">
		<table width="98%" class="listtable">
		
		<s:if test="#session.lv == 2">
			<s:hidden name="model.parentID"></s:hidden>
			<input type="hidden" name="model.lv" value="2"/>
			 <s:hidden name="model.id" id="shigongcanba"></s:hidden> 
		</s:if>
		<s:else>
			<s:hidden name="model.lv"></s:hidden>
			<s:hidden name="model.id" id="shigongcanba"></s:hidden>
		</s:else>
		
			<tr>
				<th scope="row" align="right">Name:</th>
				<td class="inp">
					<s:textfield maxlength="30" size="60" name="model.namee" id="name"></s:textfield>
					<font style="color:red;">*</font>
				</td>
			</tr>
			<tr>
				<th scope="row" align="right">Image:</th>
				<td class="inp">
					<s:file name="logo_img" id="logo" size="70px" ></s:file>
					<span style=" margin-left:100px;">
						<img align="middle" width="200" height="100" src="<%=basePath%>${model.logo}"/>
						<font style="color: red">&nbsp;*</font>
					</span><br/>
					(Don't choose pictures will not be changed)	<!-- 注：图片分辨率330px * 527px -->	
					<%-- <s:if test="#session.lv == 1">
					注：图片分辨率330px * 527px
					</s:if>
					
					<s:if test="#session.lv == 2"> --%>
					Note: the image resolution407px * 259px
					<%-- </s:if>	 --%>
				</td>
			</tr>
			<s:if test="#session.newFalg == 0">
				<tr>
					<th scope="row" align="right">On the left side of the content:</th>
					<td class="inp">
						<s:select list="adList" name="model.adid" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" />
					</td>
				</tr>
				<tr>
						<th scope="row" align="right">Order:</th>
						<td valign="top" class="inp">
							<s:radio list="#{-1:'The same', 0:'The last one', 1:'Placed in the designated program before'}" id="positionType" value="-1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
						</td>
					</tr>
					
					<tr id="LiveListTr" style="display: none;">
						<td>&nbsp;</td>
						<td valign="top">
							<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
								<s:iterator value="shopintroducelist" id="item" status="st">
									 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.name} </div>  
								</s:iterator>
							</div>
						</td>
					</tr>
				<tr>
					<th scope="row" align="right">Description:</th>
					<td class="inp">
						<s:textarea name="model.descriptione" id="description"></s:textarea>
						<script type="text/javascript">CKEDITOR.replace('model.descriptione',{toolbar : 'MyToolbar'});</script>
					Note: description of characters is not greater than five thousand characters
					</td>
				</tr>
			</s:if>	
			<s:else>
				<tr style="display:none;">
					<th scope="row" align="right">On the left side of the content:</th>
					<td class="inp">
					<s:hidden name="model.adid" id="adid"></s:hidden>
						<!-- <s:select list="adList" name="model.adid" id="leftContent" headerKey="" headerValue="请选择..." cssStyle="height:22px;"  listKey="id" listValue="name" /> -->
					</td>
				</tr>
				<tr style="display:none;">
						<th scope="row" align="right">Order:</th>
						<td valign="top" class="inp">
							<s:radio list="#{-1:'The same', 0:'The last one', 1:'Placed in the designated program before'}" id="positionType" value="-1" name="positionType" cssClass="positionType" onclick="showLiveList()"></s:radio>
						</td>
					</tr>
					
					<tr id="LiveListTr" style="display: none;">
						<td>&nbsp;</td>
						<td valign="top">
							<div style="width: 200px;height: 150px;overflow:auto;border:1px solid #03515d;">
								<s:iterator value="shopintroducelist" id="item" status="st">
									 <div> <input type="radio" name="model.position" value="${item.position}" />${st.index+1}、${item.name} </div>  
								</s:iterator>
							</div>
						</td>
					</tr>
				<tr style="display:none;">
					<th scope="row" align="right">Description:</th>
					<td class="inp">
						<s:textarea name="model.descriptione" id="description"></s:textarea>
						<script type="text/javascript">CKEDITOR.replace('model.descriptione',{toolbar : 'MyToolbar'});</script>
					Note: description of characters is not greater than five thousand characters
					</td>
				</tr>
			</s:else>
		  	<tr>
		  	<td>&nbsp;</td>
			 <td class="addButton">
		        <input type="submit" value="submit" onclick="return checkEmpty()" class="STYLE1" />
				<input type="reset" value="reset" class="STYLE1"  />
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

