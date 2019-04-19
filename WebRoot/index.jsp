<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="res/css/Program_Management.css" rel="stylesheet" type="text/css"/>
<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
<link rel="stylesheet" type="text/css" href="res/css/ui-lightness/jquery-ui-1.10.3.custom.min.css">
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/uuid.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-ui-1.10.3.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath%>res/js/ckeditor/ckeditor.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/jquery.json-2.4.min.js"></script>
	<script type="text/javascript">
	var cnt = 1;
		function addOne() {
			cnt = cnt +1;
			$("#root").append('<div style="height: 100px;width: 200px;background-color: green;left: 50;top: 20;" id="sub' + cnt + '">儿子1</div>');
			$( "#sub" + cnt).draggable({ containment:"#root",addClasses: false });
			$( "#sub" + cnt).resizable({ containment:"#root",addClasses: false })

		}

		function delDrag() {
			$("#sub2").resizable( "destroy" );
			$("#sub2").draggable( "destroy" );
		}
		function uuidtest() {
			var uuid = new UUID().createUUID().replace(/-/g, "");
			alert(uuid);
		}
	</script>
  </head>
  
  <body>
     <input value="ADD" type="button" onclick="addOne();"/>
     <input value="DEL" type="button" onclick="delDrag();"/>
     <input value="DEL" type="button" onclick="uuidtest();"/>
     </br>
     
     
     
     <form action="adremote/uploadScreenshot.action" method="post" enctype="multipart/form-data">
     	<input name="mac"/>
     	<input type="file" name="screenshot"/>
     	<input type="submit" value="提交"/>
     </form>
     
  </body>
</html>
