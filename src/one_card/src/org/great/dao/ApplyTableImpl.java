package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.DynaBeanMapDecorator;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.great.entity.ApplyTable;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;

import org.great.entity.PatientTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

public class ApplyTableImpl implements ApplyTableDao {

	String sql = null;
	int num = 0;

	@Override
	public boolean insertObject(Object obj) {
		ApplyTable applyTable = (ApplyTable) obj;
		boolean rest = false;
		System.out.println(applyTable);
		String prama[] = new String[] { applyTable.getC_applyer(), applyTable.getA_appNumber(),
				applyTable.getA_auditor(), applyTable.getA_autime(), applyTable.getC_imptime(), applyTable.getState() };
		sql = "insert into APPLYTABLE (a_id,C_APPLYER,A_APPNUMBER,A_AUDITOR,A_AUTIME,C_imptime,state) values (appid.nextval,?,?,?,?,?,?) ";
		System.out.println(sql);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, prama);
			System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {

			rest = true;
			System.out.println("申请表入库成功");

		} else {
			rest = false;
		}

		return rest;
	}

	@Override
	public boolean updateObject(Object obj) {

		boolean falg = false;
		ApplyTable applyTable = (ApplyTable) obj;
		System.out.println("ss0000016+++===" + applyTable);
		sql = "update ApplyTable set state = ?,a_auditor= ?,a_autime = ?  where a_id =?";

		num = -1;

		String[] param = new String[] { applyTable.getState(), applyTable.getA_auditor(), applyTable.getA_autime(),
				applyTable.getA_id() };
		System.out.println(param.toString());
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, param);
			if (num > 0) {
				System.out.println("修改成功");
				falg = true;
			} else {
				System.out.println("修改失败");
				falg = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return falg;

	}

	@Override
	public Object findById(String id) {
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
	public List<ApplyTable> findByc_Id(String c_id) {
		List<ApplyTable> card_Events = new ArrayList<ApplyTable>();
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<List<ApplyTable>> rsh = new BeanListHandler<ApplyTable>(ApplyTable.class);
		sql = "select * from ApplyTable where a_id = ?";
		try {
			card_Events = queryRunner.query(sql, rsh, c_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("card_Events+" + card_Events);
		return card_Events;
	}

	@Override
	public boolean updateNumber(String c_id, String newnumber) {
		boolean flag = false;
		sql = "update ApplyTable set  A_APPNUMBER = ? where a_id= ?";
		String[] param = new String[] { newnumber, c_id };
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

	@Override
	public List<ApplyTable> getAll(ApplyTable applyTable, String current, String Count) {
		String[] parma = {};
		List<ApplyTable> query = null;
		System.out.println(applyTable);
		int currentPage = Integer.parseInt(current);
		int pageCount = Integer.parseInt(Count);

		sql = "select * from (SELECT ROWNUM R,t1.* From(select * from ApplyTable   where 1 =  1 ";
		if (applyTable.getApplyTime2() != null && !applyTable.getApplyTime2().equals("")) {
			sql += " and c_imptime <=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime2());
		}
		if (applyTable.getApplyTime1() != null && !applyTable.getApplyTime1().equals("")) {
			sql += " and c_imptime >=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime1());
		}
		if (applyTable.getState() != null && !applyTable.getState().equals("")) {
			sql += " and state =?";
			parma = Staff_TableImpl.insert(parma, applyTable.getState());
		}
		if (applyTable.getC_applyer() != null && !applyTable.getC_applyer().equals("")) {
			sql += " and C_applyer =?";
			parma = Staff_TableImpl.insert(parma, applyTable.getC_applyer());
		}

		sql = sql + " ORDER BY c_imptime )t1 where rownum < ?" + " ) t2 Where t2.R > ? ";

		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		parma = Staff_TableImpl.insert(parma, "" + max);
		parma = Staff_TableImpl.insert(parma, "" + minrow);
		System.out.println(applyTable);
		System.out.println(sql);
		System.out.println(parma);
		ResultSetHandler<List<ApplyTable>> rsh = new BeanListHandler<ApplyTable>(ApplyTable.class);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
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
	public int getcount(ApplyTable applyTable) {
		int count = 0;

		String[] parma = {};

		sql = "select count(*) from ApplyTable   where 1 =  1 ";
		System.out.println("applyTable.getApplyTime2().=" + applyTable.getApplyTime2());
		if (applyTable.getApplyTime2() != null && !applyTable.getApplyTime2().equals("")) {
			sql += " and c_imptime <=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime2());
		}
		if (applyTable.getApplyTime1() != null && !applyTable.getApplyTime1().equals("")) {
			sql += " and c_imptime >=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime1());
		}
		if (applyTable.getState() != null && !applyTable.getState().equals("")) {
			sql += " and state =?";
			parma = Staff_TableImpl.insert(parma, applyTable.getState());
		}
		if (applyTable.getC_applyer() != null && !applyTable.getC_applyer().equals("")) {
			sql += " and C_applyer =?";
			parma = Staff_TableImpl.insert(parma, applyTable.getC_applyer());
		}

		System.out.println(applyTable);
		System.out.println(sql);
		System.out.println(parma);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler rsh = new ScalarHandler();
		try {
			count = Integer.parseInt(queryRunner.query(sql, rsh, parma).toString());
			System.out.println("tatal=" + count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;

	}

	@Override
	public boolean updatestate(String c_id, String state) {
		boolean flag = false;
		System.out.println("id=" + c_id);
		sql = " update  applytable set state = '" + state + "' where a_id = ?";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, c_id);
			// System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			System.out.println("更新申请表更改状态为审核成功=======成功");
			flag = true;
		} else {
			System.out.println("更新申请表更改状态为审核成功========失败");
			flag = false;
		}
		return flag;

	}

	@Override
	public List<ApplyTable> allTogetherList(ApplyTable applyTable, String current, String Count,String s_number) {
		String[] parma = {s_number,};
		List<ApplyTable> query = null;

		int currentPage = Integer.parseInt(current);
		int pageCount = Integer.parseInt(Count);

		sql = "select * from (SELECT ROWNUM R,t1.* From(select c_a.*, p.c_balance ,p.p_name from (select c.c_state, c.c_id ,a.c_imptime,a.a_autime,a.a_auditor from card_msg  c left join ApplyTable a  on a.a_id=c.c_appid where a.c_applyer=? and a.c_imptime!= 'null' and a.a_autime != 'null'  ";
		if (applyTable.getApplyTime2() != null && !applyTable.getApplyTime2().equals("")) {
			sql += " and a.c_imptime<=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime2());
		}
		if (applyTable.getApplyTime1() != null && !applyTable.getApplyTime1().equals("")) {
			sql += " and a.c_imptime >=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime1());
		}
		if (applyTable.getC_id2() != null && !applyTable.getC_id2().equals("")) {
			sql += " and c.c_id  <=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getC_id2());
		}
		if (applyTable.getC_id1() != null && !applyTable.getC_id1().equals("")) {
			sql += " and c.c_id >=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getC_id1());
		}

		sql = sql
				+ "  ) c_a left join patienttable p on p.c_id = c_a.c_id where   p.c_balance != 'null' and p.p_name != 'null' ORDER BY c_a.c_id desc )t1 where rownum < ?"
				+ " ) t2 Where t2.R > ? ";

		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		parma = Staff_TableImpl.insert(parma, "" + max);
		parma = Staff_TableImpl.insert(parma, "" + minrow);
		System.out.println(applyTable);
		System.out.println(sql);
		System.out.println(parma);
		ResultSetHandler<List<ApplyTable>> rsh = new BeanListHandler<>(ApplyTable.class);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
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
	public int allTogetherListcount(ApplyTable applyTable,String s_number) {
		int count = 0;

		String[] parma = {s_number};

		sql = "select  count(*)from (select c.c_state, c.c_id ,a.c_imptime,a.a_autime ,a.a_auditor from card_msg  c left join ApplyTable a  on a.a_id=c.c_appid where a.c_applyer=? and a.c_imptime!= 'null' and a.a_autime != 'null'  ";
		if (applyTable.getApplyTime2() != null && !applyTable.getApplyTime2().equals("")) {
			sql += " and a.c_imptime<=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime2());
		}
		if (applyTable.getApplyTime1() != null && !applyTable.getApplyTime1().equals("")) {
			sql += " and a.c_imptime >=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getApplyTime1());
		}
		if (applyTable.getC_id2() != null && !applyTable.getC_id2().equals("")) {
			sql += " and c.c_id  <=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getC_id2());
		}
		if (applyTable.getC_id1() != null && !applyTable.getC_id1().equals("")) {
			sql += " and c.c_id >=?";
			parma = Staff_TableImpl.insert(parma, applyTable.getC_id1());
		}

		sql = sql
				+ "  ) c_a left join patienttable p on p.c_id = c_a.c_id where   p.c_balance != 'null' and p.p_name != 'null' ORDER BY c_a.c_id desc";

		System.out.println(applyTable);
		System.out.println(sql);
		System.out.println(parma);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler rsh = new ScalarHandler();
		try {
			count = Integer.parseInt(queryRunner.query(sql, rsh, parma).toString());
			System.out.println("tatal=" + count);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;

	}

}
