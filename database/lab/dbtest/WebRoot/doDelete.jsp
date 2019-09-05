<%@ page import="java.util.*,dao.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	StuInfoDao dao=new StuInfoDao();
	String sno=request.getParameter("sno");
	String msg="操作出问题了,请稍后重试,或联系管理员";
	if(dao.delete(sno)){
		msg="恭喜你,操作成功,成功删除学号为"+sno+"的数据";
	}
	
 %>

<%//response.sendRedirect("index.jsp"); %>

<div id="msg"><h1><%=msg%>,5秒后返回首页,如浏览器无反应,<a href="index.jsp">请点击</a></h1></div>

 
 
