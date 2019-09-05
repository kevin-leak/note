<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>通过JDBC驱动访问sql server 2012</title>
  </head>
  <body>
    <h3 align="center">使用JDBC驱动访问sql server 2012</h3>
    <hr>
    <table border="1" bgcolor="#ccceee" align="center">
      <tr>
        <th width="87" align="center">学号</th>
        <th width="87" align="center">姓名</th>
        <th width="87" align="center">性别</th>
        <th width="87" align="center">年龄</th>
        <th width="87" align="center">所在系</th>
      </tr>
      <%
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        //与mysql有区别
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       
        /*3306为端口号,student为数据库名,url后面添加的
        ?useUnicode=true&characterEncoding=gbk用于
                处理向数据库中添加中文数据时出现乱码的问题*/
        String url="jdbc:sqlserver://127.0.0.1:1433;DatabaseName=Stu";
        //String user="djh";
        //String password="123";
        con=DriverManager.getConnection(url,"sa","password");
        stmt=con.createStatement();
        String sql="select * from Student";
        rs=stmt.executeQuery(sql);
        while(rs.next()){
      %>
      <tr>
        <td><%=rs.getString("Sno") %></td>
        <td><%=rs.getString("Sname") %></td>
        <td><%=rs.getString("Ssex") %></td>
        <td><%=rs.getString("Sage") %></td>
        <td><%=rs.getString("Sdept") %></td>
      </tr>
      <%
        }
        rs.close();
        stmt.close();
        con.close();
      %>
    </table>
  </body>
</html>
