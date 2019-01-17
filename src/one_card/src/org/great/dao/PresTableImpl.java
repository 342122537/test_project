package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.great.entity.Card_Event;
import org.great.entity.PatientTable;
import org.great.entity.PresTable;
import org.great.tools.ConnectionUtil;

public class PresTableImpl implements PresTableDao {

	private String sql = null;
	private boolean flag = false;
	private int num = 0;

	@Override
	public boolean insertObject(Object obj) {
		return flag;
		// TODO Auto-generated method stub

	}

	@Override
	public boolean updateObject(Object obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(String id) {
		PatientTable patientTable = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<PatientTable> rsh = new BeanHandler<PatientTable>(PatientTable.class);
		sql = "select * from PatientTable where c_id = ?";
		try {
			patientTable = queryRunner.query(sql, rsh, id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("patientTable+" + patientTable);

		return patientTable;
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
	public List<PresTable> findByc_Id(String c_id, int currentPage, int pageCount) {

		System.out.println("sdaaaasdsa" + currentPage + "sdsa" + pageCount + "sdsa" + c_id);
		// 显示行数
		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		List<PresTable> list = new ArrayList<PresTable>();
		// sql = "SELECT * FROM (SELECT ROWNUM R,t1.* From (SELECT * FROM PresTable
		// where c_id = '" + c_id
		// + "') t1 where rownum <" + max + " ) t2 Where t2.R > " + minrow;
		sql = "SELECT * FROM (SELECT ROWNUM R,t1.* From (SELECT * FROM PresTable where c_id =  ? ) t1 where rownum <? ) t2 Where t2.R > ?";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<PresTable>> rsh = new BeanListHandler<PresTable>(PresTable.class);
		String[] param = new String[] { c_id, "" + max, "" + minrow };
		try {
			list = queryRunner.query(sql, rsh, param);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("PresTablelist+" + list);
		return list;

	}

	@Override
	public int getTotalCount(String c_id) {
		int tatal = 0;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select count(*) FROM PresTable where c_id= '" + c_id + "'";
		// ResultSetHandler<SaleRule> rsh = new BeanHandler<SaleRule+>(SaleRule.class);

		ResultSetHandler rsh = new ScalarHandler();
		try {
			tatal = Integer.parseInt(queryRunner.query(sql, rsh).toString());
			System.out.println("tatal=" + tatal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tatal;

	}

}
