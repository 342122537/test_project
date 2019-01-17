package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.great.entity.PatientTable;
import org.great.tools.ConnectionUtil;

import oracle.net.aso.p;

public class PatientImpl implements PatientTableDao {

	private String sql = null;
	private boolean flag = false;
	private int num = 0;

	@Override
	public boolean insertObject(Object obj) {

		PatientTable patientTable = (PatientTable) obj;
		System.out.println("PatientTable" + patientTable);
		boolean rest = false;
		String prama[] = new String[] { patientTable.getC_id(), patientTable.getP_name(), patientTable.getP_sex(),
				patientTable.getP_age(), patientTable.getP_city(), patientTable.getP_idcard(),
				patientTable.getP_phone(), patientTable.getP_address(), patientTable.getC_balance(),
				patientTable.getC_deposit() };
		sql = "insert into patientTable (c_id, p_name, p_sex, p_age, p_city, p_idcard, p_phone, p_address, c_balance, c_deposit)values (?,?,?,?,?,?,?,?,?,?) ";
		System.out.println(sql);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, prama);
			/*
			 * System.out.println(sql + prama); System.out.println("num=" + num);
			 */
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {

			rest = true;
			System.out.println("病人表表入库成功");

		} else {
			rest = false;
			System.out.println("病人表表入库失败");
		}

		return rest;

	}

	@Override
	public boolean updateObject(Object obj) {

		// PatientTable patientTable = (PatientTable) obj;
		// boolean rest = false;
		// String prama[] = new String[] {
		// patientTable.getC_id(),null,null,null,null,null,null,null,null,null };
		// sql = "insert into patientTable (c_id, p_name, p_sex, p_age, p_city,
		// p_idcard, p_phone, p_address, c_balance, c_deposit)values
		// (?,?,?,?,?,?,?,?,?,?) ";
		// System.out.println(sql);
		// QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		// try {
		// num = queryRunner.update(sql, prama);
		// System.out.println("num=" + num);
		// } catch (SQLException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// if (num > 0) {
		//
		// rest = true;
		// System.out.println("病人表成功");
		//
		// } else {
		// rest = false;
		// }

		// return rest;

		return false;
	}

	@Override
	public Object findById(String id) {
		PatientTable patientTable = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<PatientTable> rsh = new BeanHandler<PatientTable>(PatientTable.class);
		sql = "select * from PatientTable where c_id = ?";
		try {
			System.out.println(sql + id);
			patientTable = queryRunner.query(sql, rsh, id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// System.out.println("patientTable+" + patientTable);

		return patientTable;
	}

	@Override
	public ArrayList<Object> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteObject(int id) {

		boolean flag = false;
		sql = " delete from  PatientTable where c_id =?";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
			System.out.println("删除病人表成功");
		} else {
			flag = false;
		}

		return flag;
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
	public Object findByc_Id(String c_id) {
		PatientTable patientTable = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<PatientTable> rsh = new BeanHandler<PatientTable>(PatientTable.class);
		sql = "select * from PatientTable where c_id = ?";
		try {
			patientTable = queryRunner.query(sql, rsh, c_id);
			System.out.println(sql + c_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("patientTable+" + patientTable);

		return patientTable;

	}

	@Override
	public PatientTable getPatinetOldid(String id_sex, String old_id) {
		PatientTable patientTable = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<PatientTable> rsh = new BeanHandler<PatientTable>(PatientTable.class);
		sql = "select * from PatientTable where " + id_sex + " = ?";
		try {
			patientTable = queryRunner.query(sql, rsh, old_id);
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("patientTable+" + patientTable);

		return patientTable;
	}

	@Override
	public boolean deleteid(String c_id) {
		boolean flag = false;
		sql = " delete from  PatientTable where c_id =?";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, c_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
			System.out.println("删除表成功");
		} else {
			flag = false;
		}
		return flag;
	}

	@Override
	public boolean updateBalance(String c_id, String newBalnce) {
		boolean flag = false;
		sql = "update patienttable set  C_BALANCE=? where c_id= ?";
		String[] param = new String[] { newBalnce, c_id };
		// QueryRunner queryRunner = new QueryRunner();.
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, param);
			System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
		} else {
			flag = false;
		}
		return flag;

	}

}
