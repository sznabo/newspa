String.prototype.trim = function() 
{ 
return this.replace(/(^\s*)|(\s*$)/g, ""); 
} 
String.prototype.ltrim = function() 
{ 
return this.replace(/(^\s*)/g, ""); 
} 
String.prototype.rTrim = function() 
{ 
return this.replace(/(\s*$)/g, ""); 
} 


function isValEmpty(id) {
	var val = document.getElementById(id).value;
	return (val.trim() == "");
}

/**
 * 验证时间,只包含小时，分钟
 */
function checkTime(str) {
	if (str.trim().length != 5) {
		return false;
	}
	var index = str.indexOf(":");
	if (index == -1) {
		return false;
	}
	var arr = str.split(":");
	if (arr.length != 2) {
		return false;
	}
	var h = str.substring(0, index);
	var m = str.substring(index + 1, str.length);
	var h_num =new Number(h);
	var m_num =new Number(m);
	if (h_num > 23) {
		return false;
	}
	if (m_num > 59) {
		return false;
	}
	return true;
}

/**
 * 比较时间
 * 
 * @param str1
 * @param str2
 */
function compareTime(str1, str2) {
	var t1= getTimeFromStr(str1);
	var t2= getTimeFromStr(str2);
	return (t1 > t2);
}


function getTimeFromStr(str) {
	var index = str.indexOf(":");
	var arr = str.split(":");
	var h = str.substring(0, index);
	var m = str.substring(index + 1, str.length);
	var h_num =new Number(h);
	var m_num =new Number(m);
	return h_num * 60 + m_num;
}

function checkAll(el, checkCls) {
	$("." + checkCls).each(function(){
	    this.checked = el.checked;
	});
}

function isMac(mac) {
	return /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/.test(mac);
}



// 去除左侧空格
function LTrim(str)
{
return str.replace(/^\s*/g,"");
}

// 去右空格
function RTrim(str)
{
return str.replace(/\s*$/g,"");
}

// 去掉字符串两端的空格
function trim(str)
{
return str.replace(/(^\s*)|(\s*$)/g, "");
}

// 去除字符串中间空格
function CTim(str)
{
return str.replace(/\s/g,'');
}

// 是否为由数字组成的字符串
function is_digitals(str)
{
var reg=/^[0-9]*$/;// 匹配整数
return reg.test(str);
}

// 验证是否为整数，包括正负数；
function Is_Int(str)
{
var reg=/^(-|\+)?\d+$/;
return reg.test(str);
}

// 是大于0的整数
function Is_positive_num(str)
{
var reg=/^\d+$/;
return reg.test(str);
}

// 负整数的验证
function Is_minus(str)
{
var reg=/^-\d+$/;
return reg.test(str);
}

// 验证是否为浮点数（正数）
function IsPositiveFloat(str)
{
	return !isNaN(str);
}

// 是否为固定电话，区号3到4位，号码7到8位,区号和号码用"－"分割开，转接号码为1到6位，用小括号括起来紧跟在号码后面
function IsTelphone(str)
{
var reg=/^[0-9]{3,4}\-\d{7,8}(\(\d{1,6}\))?$/;

if (reg.test(str))
return true;
else
return false;
}

// 手机号码验证，验证13系列和158，159几种号码，长度11位
function IsMobel(str)
{
var reg0 = /^13\d{9}$/;
var reg1 = /^158\d{8}$/;
var reg2 = /^159\d{8}$/;

return (reg0.test(str)||reg1.test(str)||reg2.test(str))
}

// 验证是否为中文
function IsChinese(str)
{
var reg=/^[\u0391-\uFFE5]+$/;
return reg.test(str);
}

// 验证是否为qq号码，长度为5－10位
function IsQq(str)
{
var reg=/^[1-9]\d{4,9}$/;
return reg.test(str);
}

// 验证邮编
function IsPostId(str)
{
var reg=/^\d{6}$/;
return reg.test(str);
}

// 验证是否未email
function IsEmail(str)
{
var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
return reg.test(str);
}

// 验证IP地址
function IsIp(str)
{
var check=function(v)
{
try
{
return (v<=255 && v>=0)
}catch(x){
return false;
}
}
var re=str.split(".")
return (re.length==4)?(check(re[0]) && check(re[1]) && check(re[2]) && check(re[3])):false
}


// 判断是否短时间，形如 (13:04:06)
function IsTime(str)
{
var a = str.match(/^(\d{1,2})(:)?(\d{1,2})\2(\d{1,2})$/);
if (a == null)
{
alert('输入的参数不是时间格式'); return false;
}
if (a[1]>24 || a[3]>60 || a[4]>60)
{
alert("时间格式不对");
return false
}
return true;
}

// 短日期，形如 (2003-12-05)
function IsDate(str)
{
var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
if(r==null)
return false;
var d= new Date(r[1], r[3]-1, r[4]);
return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
}

// 长时间，形如 (2003-12-05 13:04:06)
function IsDateTime(str)
{
var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/;
var r = str.match(reg);
if(r==null)
return false;
var d= new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]);
return (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()==r[7]);
}

// 判断字符全部由a-Z或者是A-Z的字字母组成
function Is_Letters(str)
{
var reg=/[^a-zA-Z]/g;
return reg.test(str);
}

// 判断字符由字母和数字组成。
function Is_letter_num(str)
{
var reg=/[^0-9a-zA-Z]/g;
return reg.test(str);
}

// 判断字符由字母和数字，下划线,点号组成.且开头的只能是下划线和字母
function IsUserName(str)
{
var reg=/^([a-zA-z_]{1})([\w]*)$/g;
return reg.test(str);
}

// 判断浏览器的类型
function GetBrowseType()
{
alert(window.navigator.appName);
}

// 判断ie的版本
function Get_Eidition()
{
alert(window.navigator.appVersion);
}

// 判断客户端的分辨率
function GetResolution()
{
alert(window.screen.height);
alert(window.screen.width);
}

// 判断用户名是否为数字字母下滑线
function notchinese(str)
{
var reg=/[^A-Za-z0-9_]/g
if (reg.test(str))
{
return (false);
}
else
{
return(true);
}
}

// 验证url
function IsUrl(str)
{
var reg=/^(http\:\/\/)?([a-z0-9][a-z0-9\-]+\.)?[a-z0-9][a-z0-9\-]+[a-z0-9](\.[a-z]{2,4})+(\/[a-z0-9\.\,\-\_\%\?\=\&]?)?$/i;
return reg.test(str);
}

// 判断是否含有汉字
function ContentWord(str)
{
if (escape(str).indexOf("%u")!=-1)
return true;
else
return false;
}

