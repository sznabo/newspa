<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
//----------------------------------------------------------------------------------------
	String capVal = (String)request.getAttribute("capital");
	String cityVal = (String)request.getAttribute("city");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>"/>

		<title></title>

		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
		<meta http-equiv="description" content="This is my page"/>
		
		<link href="res/css/admin.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
		<link href="res/css/rightAdd.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/rightList.css" rel="stylesheet"  type="text/css"/>
		<link href="res/css/TheDiary.css" rel="stylesheet"  type="text/css"/>
		
		
		<script language="JavaScript" src="<%=basePath%>res/js/jquery-1.8.3.min.js"></script>
		<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
		<script language="JavaScript" src="<%=basePath%>res/js/common.js"></script>
		<script type="text/javascript">
		var a = <%=session.getAttribute("language")%>		
function changeRight(url) {
 window.parent.document.getElementById("iframepage").src=url;
}
function checkIsSelectCity(){if(a==1){
	if ($("#capital option").val() == 0) {
		if ($("#city option").val() == -1) {
		alert("请您选择正确的城市！");
		return false;
		}
	}
	if($("#city option").text() == "----请选择----"){
		alert("请您选择正确的城市！");
		return false;
	}
}
if(a==2){
	if ($("#capital option").val() == 0) {
		if ($("#city option").val() == -1) {
		alert("Please choose the right city!");
		return false;
		}
	}
	if($("#city option").text() == "----请选择----"){
		alert("Please choose the right city!");
		return false;
	}
}
}
$(document).ready(function(){
	var cityChilds = [
		["----请选择----"],
		["北京","上海","天津","重庆"],
		["香港","澳门"],
		["哈尔滨","齐齐哈尔","牡丹江","大庆","伊春","双鸭山","鹤岗","鸡西","佳木斯","七台河","黑河","绥化","大兴安岭"],
		["长春","吉林","白山","白城","四平","松原","辽源","大安","通化"],
		["沈阳","大连","葫芦岛","旅顺","本溪","抚顺","铁岭","辽阳","营口","阜新","朝阳","锦州","丹东","鞍山"],
		["呼和浩特","锡林浩特","包头","赤峰","海拉尔","乌海","鄂尔多斯","锡林浩特","通辽"],
		["石家庄","唐山","张家口","廊坊","邢台","邯郸","沧州","衡水","承德","保定","秦皇岛"],
		["郑州","开封","洛阳","平顶山","焦作","鹤壁","新乡","安阳","濮阳","许昌","漯河","三门峡","南阳","商丘","信阳","周口","驻马店"],
		["济南","青岛","淄博","威海","曲阜","临沂","烟台","枣庄","聊城","济宁","菏泽","泰安","日照","东营","德州","滨州","莱芜","潍坊"],
		["太原","阳泉","晋城","晋中","临汾","运城","长治","朔州","忻州","大同","吕梁"],
		["南京","苏州","昆山","南通","太仓","吴县","徐州","宜兴","镇江","淮安","常熟","盐城","泰州","无锡","连云港","扬州","常州","宿迁"],
		["合肥","巢湖","蚌埠","安庆","六安","滁州","马鞍山","阜阳","宣城","铜陵","淮北","芜湖","宿州","淮南","池州"],
		["西安","韩城","安康","汉中","宝鸡","咸阳","榆林","渭南","商洛","铜川","延安"],
		["银川","固原","中卫","石嘴山","吴忠"],
		["兰州","白银","庆阳","酒泉","天水","武威","张掖","甘南","临夏","平凉","定西","金昌"],
		["西宁","海北","海西","黄南","果洛","玉树","海东","海南"],
		["武汉","宜昌","黄冈","恩施","荆州","神农架","十堰","咸宁","襄樊","孝感","随州","黄石","荆门","鄂州"],
		["长沙","邵阳","常德","郴州","吉首","株洲","娄底","湘潭","益阳","永州","岳阳","衡阳","怀化","韶山","张家界"],
		["杭州","湖州","金华","宁波","丽水","绍兴","衢州","嘉兴","台州","舟山","温州"],
		["南昌","萍乡","九江","上饶","抚州","吉安","鹰潭","宜春","新余","景德镇","赣州"],
		["福州","厦门","龙岩","南平","宁德","莆田","泉州","三明","漳州"],
		["贵阳","安顺","赤水","遵义","铜仁","六盘水","毕节","凯里","都匀"],
		["成都","泸州","内江","凉山","阿坝","巴中","广元","乐山","绵阳","德阳","攀枝花","雅安","宜宾","自贡","甘孜州","达州","资阳","广安","遂宁","眉山","南充"],
		["广州","深圳","潮州","韶关","湛江","惠州","清远","东莞","江门","茂名","肇庆","汕尾","河源","揭阳","梅州","中山","德庆","阳江","云浮","珠海","汕头","佛山"],
		["南宁","桂林","阳朔","柳州","梧州","玉林","桂平","贺州","钦州","贵港","防城港","百色","北海","河池","来宾","崇左"],
		["昆明","保山","楚雄","德宏","红河","临沧","怒江","曲靖","思茅","文山","玉溪","昭通","丽江","大理"],
		["海口","三亚","儋州","琼山","通什","文昌"],
		["乌鲁木齐","阿勒泰","阿克苏","昌吉","哈密","和田","喀什","克拉玛依","石河子","塔城","库尔勒","吐鲁番","伊宁"],
		["拉萨","阿里","昌都","那曲","日喀则","山南","林芝"],
		["台北","高雄"]
	];
	
	var capitalSelect = $('#cap').children('select');
	var citySelect = $('#c').children('select');
	var capVal = <%=capVal%>;
	var cityVal = <%=cityVal%>;
	var result="";   //结果存放变量
	var getCapVal = 0;
	var getCityVa = 0;
	
	//用户修改城市时触发事件
	capitalSelect.change(function(){
		citySelect.children('option').remove();
		var capitalVal = $(this).val();
		var hasActionMessages = $('#hasActionMessages').hide();
		$.each(cityChilds,function(i){
			if(i == capitalVal){
				$.each(this,function(j){ //这句代码是整篇文章的核心，如果数组有n维，还可以以同样的方法进行遍历处理。
					//在这层循环中，this代表一个一维数组的一个元素。
					 result+=this ;
					 citySelect.show();
					 $('<option value="' + j + '">' + this + '</option>').appendTo(citySelect);
				});
			}
			if(i == 0){
				//citySelect.show();
				$('#c').children('select').show();
			}
		});
		
	});
});

</script>
	</head>
<body>
<s:if test="#session.language==1">
<div class="AlonModule">
	 <div class="AlonModule_Top">
          	 <div class="AlonModule_Top1"><img alt="" src="res/images/TopColumn1.png"/></div>
          	 <div class="AlonModule_Top2">
                 <ul>
                         <li><a href="<%=basePath%>soft/list.action">软件包管理</a></li>
						<li><a href="<%=basePath%>softup/list.action">升级管理</a></li>
						<s:if test="#session._adminUser.superAdmin==1">
						<li ><a href="<%=basePath%>admin/list.action">管理员</a></li>
						</s:if>
						<li class="currentHover"><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">城市更新</a></li>
						<li><a href="<%=basePath%>functions/list.action">功能开关</a></li> 
						<!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
						<li ><a href="<%=basePath%>syslog/list.action">系统日志</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>	
<div class="AlonModule_Body">
	<div class="AlonModule_list">
<s:form action="updatecity/updateCityAction_updateCity.action" method="post" onsubmit="return checkIsSelectCity()">
 <table width="100%" class="listtable">
 	<s:hidden name="capital" id="hcapital" value=""></s:hidden>
 	<s:hidden name="city" id="hcity" value=""></s:hidden>
 <tr>
    <th scope="row"  width="10%" align="right">当前省会城市：</th>
    <td class="inp" colspan="2">
    	<span id="cap">
	    	<select style="height:25px;" name="capital" id="capital">
	    		<option value="0">----请选择----</option>
	    		<option value="1">直辖市</option>
	    		<option value="2">特别行政区</option>
	    		<option value="3">黑龙江</option>
	    		<option value="4">吉林</option>
	    		<option value="5">辽宁</option>
	    		<option value="6">内蒙古</option>
	    		<option value="7">河北</option>
	    		<option value="8">河南</option>
	    		<option value="9">山东</option>
	    		<option value="10">山西</option>
	    		<option value="11">江苏</option>
	    		<option value="12">安徽</option>
	    		<option value="13">陕西</option>
	    		<option value="14">宁夏</option>
	    		<option value="15">甘肃</option>
	    		<option value="16">青海</option>
	    		<option value="17">湖北</option>
	    		<option value="18">湖南</option>
	    		<option value="19">浙江</option>
	    		<option value="20">江西</option>
	    		<option value="21">福建</option>
	    		<option value="22">贵州</option>
	    		<option value="23">四川</option>
	    		<option value="24">广东</option>
	    		<option value="25">广西</option>
	    		<option value="26">云南</option>
	    		<option value="27">海南</option>
	    		<option value="28">新疆</option>
	    		<option value="29">西藏</option>
	    		<option value="30">台湾</option>
	    	</select>
    	</span>
    	<span id="c">
	    	<select style="height:25px;width:122px;" name="city" id="city">
	    		<option value="-1">----请选择----</option>
	    	</select>
    	</span>
    </td>
  </tr>
  <tr>
  <td class="addButton" align="center">
    </td>
    <td><input class="submit" type="submit" value="修&nbsp;改" onclick="return checkIsSelectCity()"/></td>
  </tr>
  
		<tr id="updatemsg">
			<td>&nbsp;</td>
			<td>
				当前已选择的城市为：${request.updateCity}
			</td>
		</tr>

  <s:if test="hasActionMessages()">
	<tr id="hasActionMessages">
		<td>&nbsp;</td>
		<td>
			<s:actionmessage/>
		</td>
	</tr>
</s:if>
</table>
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
                         <li><a href="<%=basePath%>soft/list.action">Soft</a></li>
						<li><a href="<%=basePath%>softup/list.action">Upgrade</a></li>
						<s:if test="#session._adminUser.superAdmin==1">
						<li ><a href="<%=basePath%>admin/list.action">Administrator</a></li>
						</s:if>
						<li class="currentHover"><a href="<%=basePath%>updatecity/updateCityAction_toUpdate.action">City</a></li>
						<li><a href="<%=basePath%>functions/list.action">Function switch</a></li> 
						<!-- <li ><a href="<%=basePath%>cloudsManage/list.action">总服务器信息</a></li> -->
						<li ><a href="<%=basePath%>syslog/list.action">Log</a></li>
                 </ul>
          	 </div>
          	 <div class="AlonModule_Top3"><img alt="" src="res/images/TopColumn3.png"/></div>
         </div>	
<div class="AlonModule_Body">
	<div class="AlonModule_list">
<s:form action="updatecity/updateCityAction_updateCity.action" method="post" onsubmit="return checkIsSelectCity()">
 <table width="100%" class="listtable">
 	<s:hidden name="capital" id="hcapital" value=""></s:hidden>
 	<s:hidden name="city" id="hcity" value=""></s:hidden>
 <tr>
    <th scope="row"  width="10%" align="right">The current provincial capital city:</th>
    <td class="inp" colspan="2">
    	<span id="cap">
	    	<select style="height:25px;" name="capital" id="capital">
	    		<option value="0">----Please select a----</option>
	    		<option value="1">直辖市</option>
	    		<option value="2">特别行政区</option>
	    		<option value="3">黑龙江</option>
	    		<option value="4">吉林</option>
	    		<option value="5">辽宁</option>
	    		<option value="6">内蒙古</option>
	    		<option value="7">河北</option>
	    		<option value="8">河南</option>
	    		<option value="9">山东</option>
	    		<option value="10">山西</option>
	    		<option value="11">江苏</option>
	    		<option value="12">安徽</option>
	    		<option value="13">陕西</option>
	    		<option value="14">宁夏</option>
	    		<option value="15">甘肃</option>
	    		<option value="16">青海</option>
	    		<option value="17">湖北</option>
	    		<option value="18">湖南</option>
	    		<option value="19">浙江</option>
	    		<option value="20">江西</option>
	    		<option value="21">福建</option>
	    		<option value="22">贵州</option>
	    		<option value="23">四川</option>
	    		<option value="24">广东</option>
	    		<option value="25">广西</option>
	    		<option value="26">云南</option>
	    		<option value="27">海南</option>
	    		<option value="28">新疆</option>
	    		<option value="29">西藏</option>
	    		<option value="30">台湾</option>
	    	</select>
    	</span>
    	<span id="c">
	    	<select style="height:25px;width:122px;" name="city" id="city">
	    		<option value="-1">----Please select a----</option>
	    	</select>
    	</span>
    </td>
  </tr>
  <tr>
  <td class="addButton" align="center">
    </td>
    <td><input class="submit" type="submit" value="Modify" onclick="return checkIsSelectCity()"/></td>
  </tr>
  
		<tr id="updatemsg">
			<td>&nbsp;</td>
			<td>
				For the current selected cities:${request.updateCity}
			</td>
		</tr>

  <s:if test="hasActionMessages()">
	<tr id="hasActionMessages">
		<td>&nbsp;</td>
		<td>
			<s:actionmessage/>
		</td>
	</tr>
</s:if>
</table>
</s:form>
 </div>
 </div>
</div>
</s:if>
</body>
</html>
