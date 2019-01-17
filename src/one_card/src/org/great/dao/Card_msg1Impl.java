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
import org.great.entity.Card_msg;
import org.great.entity.Card_msg1;
import org.great.entity.PatientTable;
import org.great.tools.ConnectionUtil;

import com.sun.org.apache.xml.internal.security.c14n.helper.C14nHelper;

public class Card_msg1Impl implements Card_msg1Dao {

	String sql = null;
	int num = 0;

	@Override
	public boolean insertObject(Object obj) {

		Card_msg1 card_msg1 = (Card_msg1) obj;
		boolean rest = false;
		String prama[] = new String[] { card_msg1.getC_id(), card_msg1.getC_leader(), card_msg1.getC_seller(), null,
				null };
		sql = "insert into Card_msg1 (c_id, c_leader, c_leaadTime, c_seller, c_sellTime)values (?,?,?,?,?) ";
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
			System.out.println("卡信息查看表入库成功");

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
	public Object findByc_Id(String c_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateBalance(String c_id, String newBalnce) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateState(String c_id, String s_tate) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String quaryC_id(String c_id1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insertCard_msg(Card_msg1 card) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean findByc_Ids(String c_id1, String c_id2) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> getAllList(Card_msg1 card, String current, String count) {
		List<Map<String, Object>> query = null;
		String[] parma = {};
		// Card_msg1 card = new Card_msg1("123", " 123", " 123", "23", "123", "123");
		// Card_msg1 card = new Card_msg1("123", null,null,null,null,null);
		int currentPage = Integer.parseInt(current);
		int pageCount = Integer.parseInt(count);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select * from (SELECT ROWNUM R,tp.* From " + "(select t1.*, p.c_balance,P.p_name from"
				+ "(select c.*,c1.c_state from Card_msg1  c left join Card_msg c1 on  c.c_id= c1.c_id where 1 = 1 ";

		if (card.getC_id() != null && (!card.getC_id().equals(""))) {
			System.out.println("card.getC_id1()" + card.getC_id());
			sql = sql + " and c.c_id  =  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_id());

		}
		if (card.getS_state() != null && (!card.getS_state().equals(""))) {
			System.out.println("card.getS_state()" + card.getS_state());
			sql = sql + " and c1.c_state  =  ?";
			parma = Staff_TableImpl.insert(parma, card.getS_state());

		}
		if (card.getC_leader() != null && (!card.getC_leader().equals(""))) {
			System.out.println("card.getC_state()" + card.getC_leader());
			sql = sql + " and c.c_leader =  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_leader());

		}

		sql = sql
				+ " ORDER BY c.c_id )t1 left join patienttable p  on  t1.c_id = p.c_id where 1=1 ) tp where rownum < ?"
				+ " ) t2 Where t2.R > ? ";

		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		parma = Staff_TableImpl.insert(parma, "" + max);
		parma = Staff_TableImpl.insert(parma, "" + minrow);
		// ResultSetHandler<List<Card_msg1>> rsh = new
		// BeanListHandler<Card_msg1>(Card_msg1.class);
		System.out.println(sql);
		try {
			query = queryRunner.query(sql, new MapListHandler(), parma);
			System.out.println("list=" + query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return query;

	}

	@Override
	public int getAllPage(Card_msg1 card, String current, String count) {
		int query = 0;
		String[] parma = {};
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select count(*) from"
				+ "(select c.*,c1.c_state from Card_msg1  c left join Card_msg c1 on  c.c_id= c1.c_id where 1 = 1 ";

		if (card.getC_id() != null && (!card.getC_id().equals(""))) {
			System.out.println("card.getC_id1()" + card.getC_id());
			sql = sql + " and c.c_id  =  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_id());

		}
		if (card.getS_state() != null && (!card.getS_state().equals(""))) {
			System.out.println("card.getS_state()" + card.getS_state());
			sql = sql + " and c1.c_state  =  ?";
			parma = Staff_TableImpl.insert(parma, card.getS_state());

		}
		if (card.getC_leader() != null && (!card.getC_leader().equals(""))) {
			System.out.println("card.getC_state()" + card.getC_leader());
			sql = sql + " and c.c_leader =  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_leader());

		}

		sql = sql + " ORDER BY c.c_id )t1 left join patienttable p  on  t1.c_id = p.c_id where 1=1";
		ResultSetHandler rsh = new ScalarHandler();
		try {
			query = Integer.parseInt(queryRunner.query(sql, rsh, parma).toString());
			System.out.println("tatal=" + query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return query;

	}

}