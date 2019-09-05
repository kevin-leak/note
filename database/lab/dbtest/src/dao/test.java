package dao;

import java.util.ArrayList;

import entity.StuInfo;

public class test {

	public static void main(String[] args) {
		
		// TODO Auto-generated method stub
		StuInfoDao dao=new StuInfoDao();
	  	ArrayList list=dao.selectAll();
	  	
	  	for(int i=0;i<list.size();i++){
			StuInfo stu=(StuInfo)list.get(i);
			System.out.println(stu.getSno()+stu.getSname()+stu.getSsex()+stu.getSage()+stu.getSdept());
			
			
	  	}

	}

}
