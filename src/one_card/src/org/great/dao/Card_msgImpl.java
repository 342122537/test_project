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
import org.great.entity.PatientTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

public class Card_msgImpl implements Card_msgDao {

	String sql = null;
	int num = 0;

	@Override
	public ArrayList<Object> getPageList(int currentPage, int pageCount, String name, String name1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object findByc_Id(String c_id) {
		Card_msg card_msg = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<Card_msg> rsh = new BeanHandler<Card_msg>(Card_msg.class);
		sql = "select * from Card_msg where c_id = ?";
		try {
			card_msg = queryRunner.query(sql, rsh, c_id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("card_msg+" + card_msg);
		return card_msg;
	}

	@Override
	public boolean updateBalance(String c_id, String newBalnce) {
		boolean flag = false;
		sql = "update Card_msg set  C_BALANCE=? where c_id= ?";
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

	public boolean findByc_Ids(String c_id1, String c_id2) {
		boolean flag = false;
		sql = "select *  from Card_msg  where c_id >=  ? and  c_id <= ?";
		String[] param = new String[] { c_id1, c_id2 };
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
			flag = false;
		} else {
			flag = true;
		}
		return flag;
	}

	@Override
	public String insertCard_msg(Card_msg card) {
		String rest = "";
		// card = new Card_msg(c_id1, c_prefix, c_num, "待领用", dateNowStr, applyer,
		// c_appid);
		String prama[] = new String[] { card.getC_id(), card.getC_prefix(), card.getC_number(), card.getC_state(),
				card.getC_imptime(), card.getC_applyer(), card.getC_appid() };
		sql = "insert into Card_msg (c_id,c_prefix,c_number,c_state,c_imptime,C_APPLYER,C_APPID) values (?,?,?,?,?,?,?) ";
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
			rest = card.getC_id() + "添加成功";

		} else {
			rest = card.getC_id() + "添加失败";
		}

		return rest;
	}

	@Override
	public String quaryC_id(String c_id1) {
		String rest = "";
		boolean flag = false;
		sql = "select *  from Card_msg  where c_id = ?";

		// QueryRunner queryRunner = new QueryRunner();.
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, c_id1);
			System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			rest = c_id1 + "添加失败";
		}

		return rest;
	}

	@Override
	public List<Card_msg> getAllList(Card_msg card, String current, String Count) {
		String[] parma = {};
		List<Card_msg> query = null;
		int currentPage = Integer.parseInt(current);
		int pageCount = Integer.parseInt(Count);
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select * from (SELECT ROWNUM R,t1.* From (select * from Card_msg  c  where 1=1 ";

		if (card.getC_id1() != null && (!card.getC_id1().equals(""))) {
			System.out.println("card.getC_id1()" + card.getC_id1());
			sql = sql + " and c.c_id  >=  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_id1());

		}
		if (card.getC_id2() != null && (!card.getC_id2().equals(""))) {
			System.out.println("card.getC_id2()" + card.getC_id2());
			sql = sql + " and c.c_id  <=  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_id2());

		}
		if (card.getC_state() != null && (!card.getC_state().equals(""))) {
			System.out.println("card.getC_state()" + card.getC_state());
			sql = sql + " and c.c_state =  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_state());

		}
		if (card.getTime1() != null && (!card.getTime1().equals(""))) {
			System.out.println("card.getTime1()" + card.getTime1());
			sql = sql + " and c.c_imptime  >=  ?";
			parma = Staff_TableImpl.insert(parma, card.getTime1());

		}
		if (card.getTime2() != null && (!card.getTime2().equals(""))) {
			System.out.println("card.getTime2()" + card.getTime2());
			sql = sql + " and c.c_imptime  <=  ?";
			parma = Staff_TableImpl.insert(parma, card.getTime2());

		}

		sql = sql + " ORDER BY c.c_imptime DESC )t1 where rownum < ?" + " ) t2 Where t2.R > ? ";

		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		parma = Staff_TableImpl.insert(parma, "" + max);
		parma = Staff_TableImpl.insert(parma, "" + minrow);
		ResultSetHandler<List<Card_msg>> rsh = new BeanListHandler<Card_msg>(Card_msg.class);

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
	public int getAllPage(Card_msg card, String current, String Count) {
		String[] parma = {};
		int tatal = 0;

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select count(*) from Card_msg  c  where 1=1 ";

		if (card.getC_id1() != null && (!card.getC_id1().equals(""))) {
			System.out.println("card.getC_id1()" + card.getC_id1());
			sql = sql + " and c.c_id  >=  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_id1());

		}
		if (card.getC_id2() != null && (!card.getC_id2().equals(""))) {
			System.out.println("card.getC_id2()" + card.getC_id2());
			sql = sql + " and c.c_id  <=  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_id2());

		}
		if (card.getC_state() != null && (!card.getC_state().equals(""))) {
			System.out.println("card.getC_state()" + card.getC_state());
			sql = sql + " and c.c_state =  ?";
			parma = Staff_TableImpl.insert(parma, card.getC_state());

		}
		if (card.getTime1() != null && (!card.getTime1().equals(""))) {
			System.out.println("card.getTime1()" + card.getTime1());
			sql = sql + " and c.c_imptime  >=  ?";
			parma = Staff_TableImpl.insert(parma, card.getTime1());

		}
		if (card.getTime2() != null && (!card.getTime2().equals(""))) {
			System.out.println("card.getTime2()" + card.getTime2());
			sql = sql + " and c.c_imptime  <=  ?";
			parma = Staff_TableImpl.insert(parma, card.getTime2());

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
	public boolean updateState(String c_id, String s_tate) {
		System.out.println("邮寄来");
		boolean flag = false;
		if (s_tate.equals("") || s_tate == null) {
			sql = " delete from  card_msg where c_id =?";

		} else {

			sql = " update  card_msg set c_state = '" + s_tate + "' where c_id =?";
		}

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, c_id);
			// System.out.println(sql);
			// System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
			System.out.println("跟新card-msg状态成功");
		} else {
			flag = false;
			System.out.println("跟新card-msg状态失败,sql=" + sql + c_id);
		}
		return flag;

	}

	@Override
	public List<Card_msg> getC_id(String a_id) {
		ArrayList<Card_msg> list = new ArrayList<Card_msg>();

		sql = "select c_id from Card_msg where c_appid ='" + a_id + "'";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<Card_msg>> rsh = new BeanListHandler<Card_msg>(Card_msg.class);
		try {
			list = (ArrayList<Card_msg>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean rs_examine(String c_id, String s_tate, String c_appid) {
		boolean flag = false;

		sql = " update  card_msg set c_state = '" + s_tate + "', c_appid = '" + c_appid + "' where c_id = ?";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, c_id);
			// System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
			System.out.println("更新卡状态,建立两表联系c_appid=========成功");
		} else {
			System.out.println("更新卡状态,建立两表联系c_appid=========失败");
			flag = false;
		}
		return flag;

	}

	@Override
	public boolean chickid(String begin_c_id, String id) {
		boolean flag = false;
		System.out.println("msg-daoIMP======begin_c_id==" + begin_c_id);
		sql = " select * from  card_msg where c_appid = 'null' and c_id = ?";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, begin_c_id);
			// System.out.println("num=" + num);
			// System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
			System.out.println("找到可用审批卡号");
		} else {
			flag = false;
			System.out.println("找到不可用审批卡号");
		}
		return flag;
	}

	@Override
	public boolean chickstate(String newc_id, String string) {

		boolean flag = false;
		sql = " select * from  card_msg where c_state = '已注销' and c_id = ?";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, newc_id);
			System.out.println("num=" + num);
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num > 0) {
			flag = true;
			System.out.println("找到已注销id");
		} else {
			flag = false;
			System.out.println("没有找到已注销");
		}
		return flag;

	}

	@Override
	public boolean chickC_id(String c_id1) {

		return false;
	}

	@Override
	public boolean insertObject(Object obj) {

		return false;
	}

	@Override
	public boolean updateObject(Object obj) {
		// TODO Auto-generated method stub
		return false;
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

}
