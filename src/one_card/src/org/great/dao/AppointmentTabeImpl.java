package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.great.entity.ApplyTable;
import org.great.entity.Appointment_Table;
import org.great.tools.ConnectionUtil;

import oracle.net.aso.p;

public class AppointmentTabeImpl implements AppointmentTableDao {
	String sql = null;
	int num = 0;

	@Override
	public boolean insertObject(Object obj) {

		Appointment_Table appointment_Table = (Appointment_Table) obj;
		boolean rest = false;
		String prama[] = new String[] { appointment_Table.getSc_id(), appointment_Table.getApp_state(),
				appointment_Table.getP_id(), appointment_Table.getApp_time(), appointment_Table.getDoc_time(),
				appointment_Table.getDoc_name(), appointment_Table.getP_name(), appointment_Table.getDoc_dept(),
				appointment_Table.getDoc_date() };
		sql = "insert into appointment_Table (app_id,sc_id,app_state,p_id,app_time,doc_time,doc_name,p_name,doc_dept,doc_date) values (appoin.nextval,?,?,?,?,?,?,?,?,?) ";
		System.out.println(sql);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, prama);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {

			rest = true;
			System.out.println("预约表插入成功");

		} else {
			rest = false;
		}

		return rest;
	}

	@Override
	public boolean updateObject(Object obj) {
		// TODO Auto-generated method stub
		return false;
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
	public List<Appointment_Table> findById(String c_id, String date) {
		List<Appointment_Table> list = new ArrayList<Appointment_Table>();
		String param[] = { c_id, date };
		try {
			sql = "select * from Appointment_Table where p_id = ? and doc_date > ?";
			QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
			ResultSetHandler<List<Appointment_Table>> rsh = new BeanListHandler<Appointment_Table>(
					Appointment_Table.class);

			list = queryRunner.query(sql, rsh, param);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Object findById(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Appointment_Table> findBydate_name(String name, String date, String dept) {
		List<Appointment_Table> list = new ArrayList<Appointment_Table>();
		String param[] = { name, date, dept };
		try {
			sql = "select * from Appointment_Table where doc_name = ? and doc_date = ? and doc_dept =?";
			QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
			ResultSetHandler<List<Appointment_Table>> rsh = new BeanListHandler<Appointment_Table>(
					Appointment_Table.class);

			list = queryRunner.query(sql, rsh, param);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Boolean updateyuyue(Appointment_Table appoin) {
		Boolean flag = false;
		sql = "update Appointment_Table set  app_state = ? ,p_id =?,app_time=?,p_name = ?  where app_id = ? ";
		String param[] = { appoin.getApp_state(), appoin.getP_id(), appoin.getApp_time(), appoin.getP_name(),
				appoin.getApp_id() };
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, param);
			if (num > 0) {
				System.out.println("修改成功");
				flag = true;
			} else {
				System.out.println("修改失败");
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;

	}

}
