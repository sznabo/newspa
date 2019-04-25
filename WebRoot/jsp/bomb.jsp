<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>bomb系统</title>
<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/audioplayer.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/main.js"></script>
<script language="JavaScript" src="<%=basePath%>res/js/Bmob-1.7.0.min.js"></script>

<script type="text/javascript">
Bmob.initialize("ee3ce0d2e22ebcd70014ef30c7d5f9b3", "2967dd7a99f3166497b4110250e97fd2");

$.ajax({
    url:"http://localhost:8793/newspa/adremote/getKehu.action" ,
    type: 'GET',
    dataType: 'json',
    success: function(data){
    	const query = Bmob.Query('Kuhu');
        query.set("K_name",data.msgBody.hotelname)
         query.save().then(res => {
          
         }).catch(err => {
        	 
         })
        
    	query.equalTo("K_name","==", data.msgBody.hotelname);
    	query.find().then(res => {
    		if(res[0].K_state == 1){
    			alert("正常进入系统");
    			$.ajax({
    	    	    url:"http://localhost:8793/newspa/adremote/updateState_x1.action" ,
    	    	    type: 'GET',
    	    	    dataType: 'json',
    	    	    success: function(d){ 
    	    	    	
    	    	    },
    	    	    
    	    	 });
    			
    		}else{
    			alert("您未交费，请联系纳博管理员");
    			$.ajax({
    	    	    url:"http://localhost:8793/newspa/adremote/updateState_x0.action" ,
    	    	    type: 'GET',
    	    	    dataType: 'json',
    	    	    success: function(d){ 
    	    	    	
    	    	    },
    	    	    
    	    	 });
    		}
    	    
    	});
    	<!--增加mac -->
    	$.ajax({
    	    url:"http://localhost:8793/newspa/adremote/getKehuMac.action" ,
    	    type: 'GET',
    	    dataType: 'json',
    	    success: function(da){ 
    	    	const query = Bmob.Query('Kuhu');
    	    	query.equalTo("K_name","==", data.msgBody.hotelname);
    	    	query.find().then(res => {
    	    		
    	    		const queryArray = new Array();
        	    	// 构造含有50个对象的数组
        	    	for(var i = 0 ; i < da.msgBody.length ; i++){
        	    	  var queryObj = Bmob.Query('Terminal');
        	    	  queryObj.set('mac',da.msgBody[i].mac);
        	    	  queryObj.set('k_id',res[0].objectId);
        	    	  queryArray.push(queryObj);
        	    	}


        	    	// 传入刚刚构造的数组
        	    	Bmob.Query('Terminal').saveAll(queryArray).then(result => {
        	    	  
        	    	}).catch(err => {
        	    	  
        	    	});
    	    	    
    	    	});
    	    	
    	    },
    	    error: function(data){
    	          
    	    }
    	 });
    },
    error: function(data){
          
    }
 });


</script>

</head>
<body>
<h1 align="center">欢迎使用纳博水疗后台</h1>
<h2 align="center"><a href="http://localhost:8793/newspa/">进入后台</a></h2>
</body>
</html>


