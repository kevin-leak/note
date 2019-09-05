<%@ page import="java.util.*,dao.*,entity.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sno=request.getParameter("sno");
	String sname=request.getParameter("sname");
	String ssex=request.getParameter("ssex");
	String sage=request.getParameter("sage");
	
	String sdept=request.getParameter("sdept");
	
	
	StuInfo stu=new StuInfo();
	stu.setSno(sno);
	stu.setSname(sname);
	stu.setSsex(ssex);
	stu.setSage(Integer.parseInt(sage));
	stu.setSdept(sdept);
	
	StuInfoDao dao=new StuInfoDao();
	dao.update(stu);
	response.sendRedirect("index.jsp");
	
%>
