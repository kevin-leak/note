package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.StuInfo;

public class StuInfoDao {
	// ��ѯ���У��飩
	public ArrayList selectAll() {
		Connection con = null;
		PreparedStatement psta = null;
		ResultSet rs = null;
		ArrayList list = new ArrayList();
		String sql = "select * from Student";
		try {
			con = BaseDao.getConnection();
			psta = con.prepareStatement(sql);
			rs = psta.executeQuery();
			while (rs.next()) {
				StuInfo stu = new StuInfo();
				stu.setSno(rs.getString(1));
				stu.setSname(rs.getString(2));
				stu.setSsex(rs.getString(3));
				stu.setSage(rs.getInt(4));
				stu.setSdept(rs.getString(5));
				list.add(stu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				BaseDao.close(rs, psta, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	}
	
	//ͨ���洢���̲�ѯ����
     
    public ArrayList findAll(){
    	Connection conn = null;
    	CallableStatement cs = null;
		ResultSet rs = null;
        ArrayList list = new ArrayList();
        
        try {
             //���ô洢����
        	conn = BaseDao.getConnection();
            cs = conn.prepareCall("{call StuInfo()}");
            rs = cs.executeQuery(); //ִ�в�ѯ����������ȡ�����
            while(rs.next()){
            	StuInfo stu = new StuInfo();
				stu.setSno(rs.getString(1));
				stu.setSname(rs.getString(2));
				stu.setSsex(rs.getString(3));
				stu.setSage(rs.getInt(4));
				stu.setSdept(rs.getString(5));
				list.add(stu);
            }
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				BaseDao.close(rs, cs, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
    }

	// ���뷽��������
	public boolean insert(StuInfo stu) {
		Connection con = null;
		PreparedStatement psta = null;
		String sql = "insert into student values(?,?,?,?,?)";
		boolean flag = false;
		try {
			con = BaseDao.getConnection();
			psta = con.prepareStatement(sql);
			psta.setString(1, stu.getSno());
			psta.setString(2, stu.getSname());
			psta.setString(3, stu.getSsex());
			psta.setString(4, stu.getSage() + "");
			psta.setString(5, stu.getSdept());

			flag = psta.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				BaseDao.close(null, psta, con);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
		}
	}

	// ɾ��������ɾ��
	public boolean delete(String sno){
				Connection con=null;
				PreparedStatement psta=null;
				boolean flag=false;
				String sql="delete from Student where sno=?";
				try{
					con=BaseDao.getConnection();
					psta=con.prepareStatement(sql);
					psta.setString(1, sno);
					flag=psta.executeUpdate()>0;
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						BaseDao.close(null, psta, con);
					}catch(Exception e){
						e.printStackTrace();
					}
					return flag;
				}
	}

	// ͨ��id�޸ģ�Ϊ������׼���ģ��ģ�
	public StuInfo selectBySno(String sno){
					Connection con=null;
					PreparedStatement psta=null;
					ResultSet rs=null;
					StuInfo stu=null;
					String sql="select * from Student where sno=?";
					try{
						con=BaseDao.getConnection();
						psta=con.prepareStatement(sql);
						psta.setString(1, sno);
						rs=psta.executeQuery();
						if(rs.next()){
							stu=new StuInfo();
							stu.setSno(rs.getString(1));
							stu.setSname(rs.getString(2));
							stu.setSsex(rs.getString(3));
							stu.setSage(rs.getInt(4));
							stu.setSdept(rs.getString(5));
														
						}
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						try{
							BaseDao.close(rs, psta, con);
						}catch(Exception e){
							e.printStackTrace();
						}
						return stu;
					}
	}

	// ���·������޸����ݣ����ģ�
	public boolean update(StuInfo stu){
						Connection con=null;
						PreparedStatement psta=null;
						String sql="update Student set Sno=?,Sname=?,Ssex=?,Sage=?,Sdept=? where Sno=?";
						boolean flag=false;
						try{
							con=BaseDao.getConnection();
							psta=con.prepareStatement(sql);
							psta.setString(1, stu.getSno());
							psta.setString(2, stu.getSname());
							psta.setString(3, stu.getSsex());
							psta.setString(4, stu.getSage()+"");
							psta.setString(5, stu.getSdept());
							
							psta.setString(6,stu.getSno());
							flag=psta.executeUpdate()>0;
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							try{
								BaseDao.close(null, psta, con);
							}catch(Exception e){
								e.printStackTrace();
							}
							return flag;
						}
	}

}
