package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.great.entity.DeptTable;
import org.great.entity.DoctorTable;
import org.great.entity.LogTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

import oracle.net.aso.f;

public class DoctorTableImpl implements DoctorTableDao {

	String sql;
	int num;
	boolean flag;

	@Override
	public boolean insertObject(Object obj) {

		DoctorTable dTable = (DoctorTable) obj;
		sql = "insert into DoctorTable (doc_id,doc_date,doc_name,doc_dept,xingqi,s_id,time) values (doct.nextval,?,?,?,?,?,?)";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		String[] param = new String[] { dTable.getDoc_date(), dTable.getDoc_name(), dTable.getDoc_dept(),
				dTable.getXingqi(), dTable.getS_id(), dTable.getTime() };
		try {
			num = queryRunner.update(sql, param);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (num > 0) {
			flag = true;
			System.out.println("插入成功");
		} else {
			System.out.println("插入失败");
			flag = false;
		}
		return flag;
	}

	@Override
	public boolean updateObject(Object obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> findAll() {

		return null;
	}

	@Override
	public boolean deleteObject(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<Object> getPageList(int currentPage, int pageCount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getPageList(int currentPage, int pageCount, String name, String name1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DoctorTable> findAlls() {
		List<DoctorTable> list = new ArrayList<DoctorTable>();
		sql = "select * from DoctorTable ";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<DoctorTable>> rsh = new BeanListHandler<DoctorTable>(DoctorTable.class);
		try {
			list = (ArrayList<DoctorTable>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<DoctorTable> findbydept(String dept, String date1, String date2) {
		List<DoctorTable> list = new ArrayList<DoctorTable>();
		List<DoctorTable> list1 = new ArrayList<DoctorTable>();
		sql = "select * from DoctorTable where doc_dept = ? and doc_date >= ? and doc_date<=?  ";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<DoctorTable>> rsh = new BeanListHandler<DoctorTable>(DoctorTable.class);
		try {
			list = (ArrayList<DoctorTable>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public DoctorTable findbydae(String dept, String date1) {
		DoctorTable staff_Table = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<DoctorTable> rsh = new BeanHandler<DoctorTable>(DoctorTable.class);
		sql = "select * from DoctorTable where doc_dept = ? and doc_date = ? ";
		try {
			staff_Table = queryRunner.query(sql, rsh, dept, date1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("staff_Table+" + staff_Table);

		return staff_Table;
	}

}
