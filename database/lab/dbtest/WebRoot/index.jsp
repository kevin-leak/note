<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="entity.*" %>
<html>
  <head>  
    <title></title>
  </head>
  <%
  	StuInfoDao dao=new StuInfoDao();
  	ArrayList list=dao.selectAll();
   %>
   
   <script type="text/javascript">
   	function myAction(sno){
   		document.forms[0].sno.value=sno;
   		document.forms[0].submit();
   	}
   </script>
  <body>
	<h1 align="center"><br></h1><h1 align="center"> 学生信息</h1>
	<form action="doDelete.jsp" method="post">
		
		<input type="hidden" name="sno">
		<table align="center" border="1" width="80%">
			<tr>
				<td colspan="8" align="right">
					<a href="insert.jsp">添加新信息</a>
				</td>
			</tr>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>系别</th>
				<th>操作</th>
			</tr>
			<%for(int i=0;i<list.size();i++){
				StuInfo stu=(StuInfo)list.get(i);%>
				<!--Html代码-->
				<tr>
					<td><%=stu.getSno()%></td>
					<td><%=stu.getSname()%></td>
					<td><%=stu.getSsex()%></td>
					<td><%=stu.getSage()%></td>
					<td><%=stu.getSdept()%></td>
					<td>
						
						<a href="update.jsp?id=<%=stu.getSno()%>">修改</a> 
						<input type="button" value="删除" onclick="myAction('<%=stu.getSno()%>')"/>
					</td>
				</tr>
			<%}%>
		</table>
	</form>
  </body>
<html>
