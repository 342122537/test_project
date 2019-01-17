package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.great.entity.Card_Event;
import org.great.entity.Card_msg;

import org.great.entity.PatientTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

public class Card_EventImpl implements Card_EventDao {

	String sql = null;
	int num = 0;

	@Override
	public boolean insertObject(Object obj) {
		//进来了吗
		System.out.println("进来了吗");
		Card_Event card_Event = (Card_Event) obj;
		boolean flag = false;
		try {
			QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

			sql = "insert into Card_Event(E_ID,C_ID,E_EVENT,E_TIME,S_ID,E_MONEY)" + " values(e_id.Nextval,?,?,?,?,?) ";
			String[] param = new String[] { card_Event.getC_id(), card_Event.getE_event(), card_Event.getE_time(),
					card_Event.getS_id(), card_Event.getE_money() };

			num = queryRunner.update(sql, param);
			System.out.println(sql +param.toString());
			if (num > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(flag);
		return flag;
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

	@Override
	public ArrayList<Object> getPageList(int currentPage, int pageCount, String name, String name1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Card_Event> findByc_Id(String c_id) {
		List<Card_Event> card_Events = new ArrayList<Card_Event>();
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<List<Card_Event>> rsh = new BeanListHandler<Card_Event>(Card_Event.class);
		sql = "select * from Card_Event where c_id = ?";
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

}
