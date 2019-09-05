package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class BaseDao {
	public static Connection getConnection() throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url="jdbc:sqlserver://127.0.0.1:1433;database=stu";
		return DriverManager.getConnection(url, "sa", "password");
	}
	public static void close(ResultSet rs,Statement stat,Connection conn)throws Exception{
		if(rs!=null){
                 //�رս����
               rs.close();
		}
		if(stat!=null){
                 //�رղ������
                stat.close();
		}
		if(conn!=null){
                //�ر�����
               conn.close();
		}
	}


}
