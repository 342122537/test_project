package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.great.entity.Card_Event;
import org.great.entity.DeptTable;
import org.great.entity.PatientTable;
import org.great.entity.PresTable;
import org.great.entity.RoleTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

import com.sun.org.apache.bcel.internal.generic.Select;

import oracle.net.aso.l;

public class DeptTableImpl implements DeptTableDao {

	private String sql = null;
	private boolean flag = false;
	private int num = 0;

	@Override
	public boolean insertObject(Object obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateObject(Object obj) {
		
		
		
		
		
		return false;
	}

	@Override
	public Object findById(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> findAll() {
		// TODO Auto-generated method stub
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
	public List<DeptTable> getAll() {
		// TODO Auto-generated method stub
		ArrayList<DeptTable> list = new ArrayList<DeptTable>();

		sql = "select * from DeptTable";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<DeptTable>> rsh = new BeanListHandler<DeptTable>(DeptTable.class);
		try {
			list = (ArrayList<DeptTable>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public DeptTable getr_name(String d_id) {

		DeptTable staff_Table = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<DeptTable> rsh = new BeanHandler<DeptTable>(DeptTable.class);
		sql = " select * from DeptTable where d_id = ?";
		try {
			staff_Table = queryRunner.query(sql, rsh, d_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("staff_Table+" + staff_Table);

		return staff_Table;

	}

}
