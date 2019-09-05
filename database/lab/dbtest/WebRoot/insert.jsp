<%@ page import="java.util.*" pageEncoding="UTF-8"%>
 
<html>
  <head>
    <title></title>
  </head>

  <script type="text/javascript">
  	function myBack(){
  		//将浏览器导航为index.jsp,location.href属性可以更改当前浏览器地址栏的内容
  		location.href="index.jsp";
 		//window.location.href="index.jsp";
 
  	}
  	
  </script>
  <body>
	<h1 align="center">新增信息</h1>
	<form action="doInsert.jsp" method="post" >
		<table align="left" width="50%">
			<!-- 学号 -->
			<tr>
				<td align="right" width="37%">学号:</td>
				<td align="left" width="25%"><input type="text" name="sno" ></td> 
				
			</tr>
			<!-- 姓名 -->
			<tr>
				<td align="right" width="37%">姓名:</td>
				<td align="left" width="25%"><input type="text" name="sname" ></td> 
				
			</tr>
			<!-- 性别 -->
			<tr>
				<td align="right">性别:</td>
				<td align="left" colspan="2"><input type="radio" name="ssex" value="男" checked="checked">男
				<input type="radio" name="ssex" value="女" />女</td> 
			</tr>
			<!-- 年龄 -->
			<tr>
				<td align="right">年龄:</td>
				<td align="left" colspan="2"><select name="sage">
				<% for(int i=16;i<=40;i++){%>
					<option value="<%=i%>" ><%=i%></option>
				<%} %>
				</select></td> 
			</tr>
			
			<!-- 系别 -->
			
			<tr>
				<td align="right" width="37%">系别:</td>
				<td align="left" width="25%"><input type="text" name="sdept" ></td> 
				
			</tr>
			
			<!-- 按钮 -->
			<tr>
				<td align="center" colspan="3">
					<input type="submit" value="添加" >
					    
					<input type="button" value="返回"  onclick="myBack()">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
