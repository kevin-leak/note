<%@ page import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sno=request.getParameter("id");
	System.out.println("xuehao"+sno);
	StuInfoDao dao=new StuInfoDao();
	StuInfo stu=dao.selectBySno(sno);
	
	//准备好常量
	ArrayList sexs=new ArrayList();
	sexs.add("男");
	sexs.add("女");

 %>
<html>
  <head>
    <title></title>
  </head>
  <script type="text/javascript">
  	function myBack(){
  		location.href="index.jsp";
  	}
  
  	
  </script>
  <body>

	<h1 align="center">修改信息</h1>
	<form action="doUpdate.jsp" method="post" >
		
		<table align="left" width="50%">
			<!-- 学号 -->
			<tr>
				<td align="right" width="37%">学号:</td>
				<td align="left" width="25%"><input type="text" name="sno" value="<%=stu.getSno()%>" ></td> 
				
			</tr>
			<!-- 姓名 -->
			<tr>
				<td align="right" width="37%">姓名:</td>
				<td align="left" width="25%"><input type="text" name="sname" value="<%=stu.getSname()%>" ></td> 
				
			</tr>
			<!-- 性别 -->
			<tr>
				<td align="right">性别:</td>
				<td align="left" colspan="2">
					<%for(int i=0;i<sexs.size();i++){%>
						<input type="radio" name="ssex" value="<%=sexs.get(i).toString()%>"
						<%if(stu.getSsex().equalsIgnoreCase(sexs.get(i).toString())){%>
						checked="checked"
						<% } %>
						/><%=sexs.get(i).toString()%>
					<% } %>
				</td> 
			</tr>
			<!-- 年龄 -->
			<tr>
				<td align="right">年龄:</td>
				<td align="left" colspan="2"><select name="sage">
				<% for(int i=16;i<=40;i++){%>
					<option value="<%=i%>" <%if(stu.getSage()==i){out.print("selected='selected'");} %>><%=i%></option>
				<%} %>
				</select></td> 
			</tr>
			<!-- 系别 -->
			<tr>
				<td align="right" width="37%">系别:</td>
				<td align="left" width="25%"><input type="text" name="sdept" value="<%=stu.getSdept()%>" ></td> 
				
			</tr>
			
			<!-- 按钮 -->
			<tr>
				<td align="center" colspan="3">
					<input type="submit" value="修改" >
					    
					<input type="button" value="返回"  onclick="myBack()">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>
