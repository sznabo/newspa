<%@page import="com.boyue.framework.common.PageBean"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pageName = request.getParameter("pageName");
if (pageName == null) {
	pageName = "pageBean";
}
PageBean pageObj = (PageBean) request.getAttribute(pageName);

%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	function jumpPage(pageNo) {
		var pageForm = document.getElementById("_pageForm");
		document.getElementById("_pageNo").value= pageNo;
		pageForm.submit();
	}
</script>
<s:if test="#session.language==1">			
			<a href="javascript:jumpPage(1)" style="font-size:13px; color:#888888; text-decoration:none;">首页</a>
			
			<%if (pageObj.getCurrentPage() > 1) { %>
			<a href="javascript:jumpPage(<%=pageObj.getCurrentPage() -1 %>)" style="font-size:13px; color:#888888; text-decoration:none;">上一页</a>
			<%} else {%>
			<a class="images_After" href="javascript:void(0);" style="font-size:13px; color:#ccd0d3; text-decoration:none;">上一页</a>
			<%} %>
			
			<%if (pageObj.getCurrentPage() < pageObj.getTotalPage()) { %>
			<a href="javascript:jumpPage(<%=pageObj.getCurrentPage() +1 %>)" style="font-size:13px; color:#888888; text-decoration:none;">下一页</a>
			<%} else {%>
			<a  class="images_After"  href="javascript:void(0);" style="font-size:13px; color:#ccd0d3; text-decoration:none;">下一页</a>
			<%} %>
			
			<a href="javascript:jumpPage(<%=pageObj.getTotalPage()%>)" style="font-size:13px; color:#888888; text-decoration:none;">末页</a>
			
			<span style="font-size:13px; color:#888888; text-decoration:none;"><%=pageObj.getCurrentPage()%>/<%=pageObj.getTotalPage() %>页  &nbsp;共<%=pageObj.getTotalRows() %>条记录</span>
			
			
			<span style="font-size:13px; color:#888888; text-decoration:none;">跳转到 
			<select id="selectJumpPage" onchange="jumpPage(this.value)">
			<%
				for(int i=1; i<=pageObj.getTotalPage(); i++) {
			%>
			<option <% if(pageObj.getCurrentPage() == i){%>selected="selected"<%} %> value="<%=i%>"><%=i%></option>
			<%}%>
			</select>
			</span>
	<form action="${param.actionName}" method="post" id="_pageForm">
		<input type="hidden"   name="pageNo" id="_pageNo" />
		<%
			Enumeration parameterNames = request.getParameterNames();
			while (parameterNames.hasMoreElements() ) {
				String key = parameterNames.nextElement().toString();
				if (key.equals("pageNo") || key.equals("actionName")) {
					continue;
				}
				String[] parameterValues = request.getParameterValues(key);
				for (String v : parameterValues) {
					%>
					<input type="hidden" name="<%=key%>" value="<%=v%>" />
		<%	
				}
			}
		%>
		
		
	</form>
	</s:if>
	<s:if test="#session.language==2">			
			<a href="javascript:jumpPage(1)" style="font-size:13px; color:#888888; text-decoration:none;">First Page &nbsp;</a>
			
			<%if (pageObj.getCurrentPage() > 1) { %>
			<a href="javascript:jumpPage(<%=pageObj.getCurrentPage() -1 %>)" style="font-size:13px; color:#888888; text-decoration:none;">Back&nbsp;</a>
			<%} else {%>
			<a class="images_After" href="javascript:void(0);" style="font-size:13px; color:#ccd0d3; text-decoration:none;">Back&nbsp;
</a>
			<%} %>
			
			<%if (pageObj.getCurrentPage() < pageObj.getTotalPage()) { %>
			<a href="javascript:jumpPage(<%=pageObj.getCurrentPage() +1 %>)" style="font-size:13px; color:#888888; text-decoration:none;">Next&nbsp;</a>
			<%} else {%>
			<a  class="images_After"  href="javascript:void(0);" style="font-size:13px; color:#ccd0d3; text-decoration:none;">Next &nbsp;</a>
			<%} %>
			
			<a href="javascript:jumpPage(<%=pageObj.getTotalPage()%>)" style="font-size:13px; color:#888888; text-decoration:none;">Last Page&nbsp;</a>
			
			<span style="font-size:13px; color:#888888; text-decoration:none;"><%=pageObj.getCurrentPage()%>/<%=pageObj.getTotalPage() %>&nbsp;Page  &nbsp;Total <%=pageObj.getTotalRows() %>records</span>
			
			
			<span style="font-size:13px; color:#888888; text-decoration:none;">&nbsp;Page To
			<select id="selectJumpPage" onchange="jumpPage(this.value)">
			<%
				for(int i=1; i<=pageObj.getTotalPage(); i++) {
			%>
			<option <% if(pageObj.getCurrentPage() == i){%>selected="selected"<%} %> value="<%=i%>"><%=i%></option>
			<%}%>
			</select>
			</span>
	<form action="${param.actionName}" method="post" id="_pageForm">
		<input type="hidden"   name="pageNo" id="_pageNo" />
		<%
			Enumeration parameterNames = request.getParameterNames();
			while (parameterNames.hasMoreElements() ) {
				String key = parameterNames.nextElement().toString();
				if (key.equals("pageNo") || key.equals("actionName")) {
					continue;
				}
				String[] parameterValues = request.getParameterValues(key);
				for (String v : parameterValues) {
					%>
					<input type="hidden" name="<%=key%>" value="<%=v%>" />
		<%	
				}
			}
		%>
		
		
	</form>
	</s:if>
	
