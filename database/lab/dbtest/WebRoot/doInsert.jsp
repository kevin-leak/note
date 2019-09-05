<%@ page import="java.util.*,entity.*,dao.*" pageEncoding="UTF-8"%>
<!-- 处理操作的页面，并非用于显示数据,所以无需任何HTML代码 -->
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
	dao.insert(stu);
	
	//除了request外,还有个隐藏的对象叫response
	//response也是隐式对象，无需声明就可以直接使用
	//和request不同的地方在于,它是表示响应
	//现在我们要做的时候结束完所有工作后，页面重新为index.jsp
	//所以需要通过响应对象将index.jsp页面响应回客户浏览器，否则客户浏览器得到的是doadd.jsp的页面代码
	//换句话说就是空无一物
	response.sendRedirect("index.jsp");
%>
