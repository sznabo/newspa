<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
int i=1;
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<title>直播单模列表</title>
<style type="text/css">
<!--
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
-->
</style>
<script type="text/javascript">
var a = <%=session.getAttribute("language")%>
	
 
	function addLiveChlLink(){
		window.location.href = "admin/singelLive_toAddLive.action";
	}

	function delRoleLink() {if(a==1){
		var obj = document.getElementsByName('liveid');
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
		        var type = confirm("确认要删除么(如果频道已发布则无法删除)");
			        if(type == false){
			        	return;
			        }
				location.href = "<%=basePath%>singelLive/delLive.action?liveid="+ids;
				}
	}
	if(a==2){
		var obj = document.getElementsByName('liveid');
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
		        var type = confirm("Confirm to delete it, if the channel has issued cannot delete)");
			        if(type == false){
			        	return;
			        }
				location.href = "<%=basePath%>singelLive/delLive.action?liveid="+ids;
				}
	}
	}
	//发布直播频道
	function releaseLiveLink(){if(a==1){
		var obj = document.getElementsByName('liveid');
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
		        var type = confirm("确认要发布么");
			        if(type == false){
			        	return;
			        }
				location.href = "<%=basePath%>singelLive/releaseLive.action?liveid="+ids;
				}
	}
	if(a==2){
		var obj = document.getElementsByName('liveid');
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
		        var type = confirm("Confirm to publish it");
			        if(type == false){
			        	return;
			        }
				location.href = "<%=basePath%>singelLive/releaseLive.action?liveid="+ids;
				}
	}
	}
	
	//撤销发布视频
	function revokeReleaseLive(){if(a==1){
		var obj = document.getElementsByName('liveid');
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					if ($(obj[i]).attr("ifable") == 1) {//已发布的不能删除
						ids.push(id);
					}
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
		        var type = confirm("确认要撤销发布么");
			        if(type == false){
			        	return;
			        }
				location.href = "<%=basePath%>singelLive/revokeReleaseLive.action?liveid="+ids+"&type=showLiveList";
				}
	}	
	if(a==2){
		var obj = document.getElementsByName('liveid');
		var ids = [];
			for ( var i = 0; i < obj.length; i++) {
				if(obj[i].checked == true){
					var id = obj[i].value;
					if ($(obj[i]).attr("ifable") == 1) {//The published cannot be deleted
						ids.push(id);
					}
			}
		}
			if (ids.length<=0){
		        alert('请先选择！');
		        return false;
		    }else {
		        var type = confirm("Confirm to the publication");
			        if(type == false){
			        	return;
			        }
				location.href = "<%=basePath%>singelLive/revokeReleaseLive.action?liveid="+ids+"&type=showLiveList";
				}
	}	
	}
	
	
	function liveSingleInfo(liveid){
		window.location.href = "admin/singelLive_loadLiveByID.action?liveid="+liveid+"&type=liveinfo";		
	}	
	
	//加载直播信息
	function loadLiveLink(liveid){
		window.location.href = "<%=basePath%>singelLive/loadLiveByID.action?liveid="+liveid+"&type=modifylive";
	}
	
	function findLiveManagementName(){
	    alert("sdf");
		document.getElementById("searchForm").submit();
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">直播双模管理</a></li>
                 </ul>
                  <ul> 
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action">直播单模管理</a></li>
                 </ul>
           </div>
            <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     <div class="AlonModule_list">
      <s:form method="post" action="list" namespace="/singelLive" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	频道：<s:textfield name="liveName" id="name" maxlength="50"></s:textfield>
  									<input type="Submit"  value="搜&nbsp;索" class="Sear" style="margin-left:20px"/>
	                              	&nbsp;
	                              	 <input name="Submit" type="button" class="right-button08" style="margin-left:24px; height:30px; color:gray" value="发布直播频道" onclick="releaseLiveLink()"/>
		                             <input name="Submit" type="button" class="right-button08" style="margin-left:28px; height:30px; color:gray" value="撤销发布" onclick="revokeReleaseLive()"/>	      	      
	                         	</div>
	                         </div>
	                         
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>singelLive/toAddLive.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/> 添加</a>
	                              	 <a href="javascript:void(delRoleLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/> 删除</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           
	           </s:form>
 <div class="ContentInformation">
        <table width="100%" class="table1">
				<tr class="TableTitle">
					<th scope="col" width="2%"><input type="checkbox" id="delid" name="delid" onclick="checkAll(this, 'checkCls');" /></th>
					<th scope="col" width="1%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">顺序</div></th>
					<th scope="col" width="20%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">直播名称</div></th>
					<th scope="col" width="30%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">直播地址</div></th>
					<th scope="col" width="10%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">序号</div></th> 
					<th scope="col" width="8%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">状态</div></th>
					<th scope="col" width="5%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">操作</div></th>										
				</tr>
		 <s:form action="singelLive/list.action?type=goListLiveMange" method="post">
	      <s:iterator value="pageBean.elements" status="st">
	      <tr id="otd">
	      	<!-- checkbox -->
	        <td class="check" width="2%"><input class="checkCls" ifable="${ifable}" type="checkbox" id="liveid" name="liveid" value="${id}"/></td> 
	        <!-- 序号 -->
	        <td width="1%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center"> <s:property value="#st.index + 1 + pageBean.currentPage * (pageBean.pageNo -1)"/> </div></td>			        
	        <!-- 直播名称 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center" > <s:property value="livemanagementname"/> </div></td>
	        <!-- 直播地址 -->
	        <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center" class="texthidden_150"><s:property value="livemanagementaddress"/></div></td>

	        <!-- 序号 -->
	       <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center"><s:property value="position"/></div></td> 
	        
	        <!-- 描述 
	        <td width="20%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center" class="texthidden_150"><s:property value="description"/></div></td>-->
	        <!-- 发布 -->
	        <td width="8%" height="25" class="STYLE1" nowrap="nowrap" align="center" >
	        	<div align="center">
	        		<s:if test="%{ifable==1}"><font style="color: #008000">已发布</font></s:if>
	        		<s:else><div align="center" style="color: #9400D3">未发布</div></s:else>
	        	</div>
	        </td>
       		<!--操作 -->
	        <td class="Operating" nowrap="nowrap" width="15%">
				<s:if test="%{ifable==1}">
	        	<img alt="" src="res/images/Modification.png"/>【修改】
	        	</s:if>
	        	<s:else>
	        	<a href="javascript:loadLiveLink(${id})"><img alt="" src="res/images/Modification.png"/>【修改】</a></s:else>
			</td>
	      </tr>
	      </s:iterator>	
		</s:form>
		<tr>
		  <td colspan="7">
			<div>
				<jsp:include page="/jsp/page.jsp" flush="false">
					<jsp:param value="singelLive/list.action?type=goListLiveMange" name="actionName"/>
				</jsp:include>
			</div>
		 </td>
		</tr>
	    <!-- 显示内容结束 -->

 	
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
                      <li ><a style="white-space: nowrap;" href="<%=basePath%>live/liveManagementAction_home.action">Live dual-mode</a></li>
                 </ul>
                  <ul> 
                      <li class="currentHover"><a style="white-space: nowrap;" href="<%=basePath%>singelLive/list.action">Live single-mode</a></li>
                 </ul>
           </div>
            <div class="AlonModule_Top3"><img alt="" src="<%=basePath%>res/images/TopColumn3.png"/></div>
     </div>
     <div class="AlonModule_Body">
     <div class="AlonModule_list">
      <s:form method="post" action="list" namespace="/singelLive" id="searchForm" >
	           <div class="ProgramList_Search">
	           		
	                         <div class="Search">
	                          <div class="add_darImg1"></div>
	                              <div class="add_darBackground" style="background:#EEEEEE;">
	                              	Channel:<s:textfield name="liveName" id="name" maxlength="50"></s:textfield>
  									<input type="Submit"  value="search" class="Sear" style="margin-left:20px"/>
	                              	&nbsp;
	                              	 <input name="Submit" type="button" class="right-button08" style="margin-left:24px; height:30px; color:gray" value="发布直播频道" onclick="releaseLiveLink()"/>
		                             <input name="Submit" type="button" class="right-button08" style="margin-left:28px; height:30px; color:gray" value="撤销发布" onclick="revokeReleaseLive()"/>	      	      
	                         	</div>
	                         </div>
	                         
	                         
	                         <div class="add_dar" style="margin-right:10px;">
	                              <div class="add_darImg1"><img src="res/images/icons_01.png"/></div>
	                              <div class="add_darBackground">
	                              	 <a href="<%=basePath%>singelLive/toAddLive.action"><img alt="" src="res/images/Gnome-List-Add-32.png"/>Add</a>
	                              	 <a href="javascript:void(delRoleLink());"><img alt="" src="res/images/Gnome-Window-Close-32.png"/>Delete</a></div>
	                              <div class="add_darImg2"><img width="15" src="res/images/icons_03.png"/></div>
	                         </div>
	           </div>
	           
	           </s:form>
 <div class="ContentInformation">
        <table width="100%" class="table1">
				<tr class="TableTitle">
					<th scope="col" width="2%"><input type="checkbox" id="delid" name="delid" onclick="checkAll(this, 'checkCls');" /></th>
					<th scope="col" width="1%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">The order</div></th>
					<th scope="col" width="20%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Name</div></th>
					<th scope="col" width="30%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Broadcast address</div></th>
					<th scope="col" width="10%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Number</div></th> 
					<th scope="col" width="8%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">State</div></th>
					<th scope="col" width="5%" height="35" class="STYLE1" nowrap="nowrap" bgcolor="#EEEEEE"><div align="center">Operation</div></th>										
				</tr>
		 <s:form action="singelLive/list.action?type=goListLiveMange" method="post">
	      <s:iterator value="pageBean.elements" status="st">
	      <tr id="otd">
	      	<!-- checkbox -->
	        <td class="check" width="2%"><input class="checkCls" ifable="${ifable}" type="checkbox" id="liveid" name="liveid" value="${id}"/></td> 
	        <!-- 序号 -->
	        <td width="1%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center"> <s:property value="#st.index + 1 + pageBean.currentPage * (pageBean.pageNo -1)"/> </div></td>			        
	        <!-- 直播名称 -->
	        <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center" > <s:property value="livemanagementname"/> </div></td>
	        <!-- 直播地址 -->
	        <td width="30%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center" class="texthidden_150"><s:property value="livemanagementaddress"/></div></td>

	        <!-- 序号 -->
	       <td width="10%" height="25" class="STYLE1" nowrap="nowrap" align="center" ><div align="center"><s:property value="position"/></div></td> 
	        
	        <!-- 描述 
	        <td width="20%" height="25" class="STYLE1" nowrap="nowrap" align="center" bgcolor="#FFFFFF"><div align="center" class="texthidden_150"><s:property value="description"/></div></td>-->
	        <!-- 发布 -->
	        <td width="8%" height="25" class="STYLE1" nowrap="nowrap" align="center" >
	        	<div align="center">
	        		<s:if test="%{ifable==1}"><font style="color: #008000">The published</font></s:if>
	        		<s:else><div align="center" style="color: #9400D3">Not release</div></s:else>
	        	</div>
	        </td>
       		<!--操作 -->
	        <td class="Operating" nowrap="nowrap" width="15%">
				<s:if test="%{ifable==1}">
	        	<img alt="" src="res/images/Modification.png"/>【Modify】
	        	</s:if>
	        	<s:else>
	        	<a href="javascript:loadLiveLink(${id})"><img alt="" src="res/images/Modification.png"/>【Modify】</a></s:else>
			</td>
	      </tr>
	      </s:iterator>	
		</s:form>
		<tr>
		  <td colspan="7">
			<div>
				<jsp:include page="/jsp/page.jsp" flush="false">
					<jsp:param value="singelLive/list.action?type=goListLiveMange" name="actionName"/>
				</jsp:include>
			</div>
		 </td>
		</tr>
	    <!-- 显示内容结束 -->

 	
</table> 
</div>
 </div>
</div>
</div>
</s:if>
</body>
</html>
