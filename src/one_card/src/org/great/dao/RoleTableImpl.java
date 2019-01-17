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
import org.great.entity.PatientTable;
import org.great.entity.PresTable;
import org.great.entity.RoleTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

import com.sun.org.apache.bcel.internal.generic.Select;

import oracle.net.aso.l;

public class RoleTableImpl implements RoleTableDao {

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
	public List<RoleTable> getAll() {
		ArrayList<RoleTable> list = new ArrayList<RoleTable>();

		sql = "select * from RoleTable order by r_id";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<RoleTable>> rsh = new BeanListHandler<RoleTable>(RoleTable.class);
		try {
			list = (ArrayList<RoleTable>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public RoleTable getr_name(String r_id) {

		RoleTable staff_Table = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<RoleTable> rsh = new BeanHandler<RoleTable>(RoleTable.class);
		sql = " select * from RoleTable where r_id = ?";
		try {
			staff_Table = queryRunner.query(sql, rsh, r_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("staff_Table+" + staff_Table);

		return staff_Table;

	}

}
