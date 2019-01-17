package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.great.entity.Card_msg;
import org.great.entity.LogTable;
import org.great.tools.ConnectionUtil;

import jdk.nashorn.internal.ir.Flags;
import oracle.net.aso.f;
import oracle.net.aso.l;

public class LogTableImpl implements LogTableDao {
	String sql = null;
	int num = 0;
	boolean flag = false;

	@Override
	public boolean insertObject(Object obj) {
		LogTable logTable = (LogTable) obj;
		sql = "insert into LogTable (l_id,u_id,l_time,l_even) values (logss.nextval,?,?,?)";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		String[] param = new String[] { logTable.getU_id(), logTable.getL_time(), logTable.getL_even() };
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
	public int getTotalCount(String time1, String time2) {
		String[] parma = {};
		int tatal = 0;

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		sql = "SELECT count(*) From logtable where 1 = 1";

		if (time1 != null && (!time1.equals(""))) {

			sql = sql + " and  l_time  >=  ?";
			parma = Staff_TableImpl.insert(parma, time1);

		}
		if (time2 != null && (!time2.equals(""))) {
			System.out.println("time2" + time2);
			sql = sql + " and  l_time <=  ?";
			parma = Staff_TableImpl.insert(parma, time2);

		}
		ResultSetHandler rsh = new ScalarHandler();
		try {
			tatal = Integer.parseInt(queryRunner.query(sql, rsh, parma).toString());
			System.out.println("tatal=" + tatal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tatal;
	}

	@Override
	public List<LogTable> getAllList(String current, int pageCount, String time1, String time2) {
		String[] parma = {};
		List<LogTable> query = null;
		int currentPage = Integer.parseInt(current);

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select * from (SELECT ROWNUM R,t1.* From (SELECT * From logtable where 1 = 1";

		if (time1 != null && (!time1.equals(""))) {

			sql = sql + " and  l_time  >=  ?";
			parma = Staff_TableImpl.insert(parma, time1);

		}
		if (time2 != null && (!time2.equals(""))) {
			System.out.println("time2" + time2);
			sql = sql + " and  l_time <=  ?";
			parma = Staff_TableImpl.insert(parma, time2);

		}

		sql = sql + " ORDER BY  l_time desc )t1 where rownum < ?" + " ) t2 Where t2.R > ? ";

		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		parma = Staff_TableImpl.insert(parma, "" + max);
		parma = Staff_TableImpl.insert(parma, "" + minrow);
		ResultSetHandler<List<LogTable>> rsh = new BeanListHandler<LogTable>(LogTable.class);

		try {
			query = queryRunner.query(sql, rsh, parma);
			System.out.println("list=" + query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
	}

	@Override
	public int getCount(String s_name, String event, String time1, String time2) {
		int tatal = 0;
		sql = "SELECT count(*) From logtable where l_even = ? and u_id = ?";
		String[] parma = { event, s_name };

		if (time1 != null && (!time1.equals(""))) {

			sql = sql + " and  l_time  <=  ?";
			parma = Staff_TableImpl.insert(parma, time1);

		}
		if (time2 != null && (!time2.equals(""))) {
			System.out.println("time2" + time2);
			sql = sql + " and  l_time >=  ?";
			parma = Staff_TableImpl.insert(parma, time2);

		}
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler rsh = new ScalarHandler();
		try {
			tatal = Integer.parseInt(queryRunner.query(sql, rsh, parma).toString());
			// System.out.println("tatal=" + tatal);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tatal;
	}

}
