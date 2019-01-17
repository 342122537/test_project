package org.great.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.great.entity.Card_msg;
import org.great.entity.MenuTable;
import org.great.entity.RoleTable;
import org.great.tools.ConnectionUtil;
import org.junit.experimental.theories.FromDataPoints;

import com.mchange.lang.CharUtils;
import com.sun.org.apache.bcel.internal.generic.Select;

import oracle.net.aso.i;
import oracle.net.aso.p;
import oracle.net.aso.q;

public class MenuTaleImpl implements MemuTableDao {
	String sql = null;
	int num = 0;

	@Override
	public boolean insertObject(Object obj) {
		// TODO Atuo-generated method stub
		return false;
	}

	@Override
	public boolean updateObject(Object obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object findById(String name) {
		sql = "select * from MenuTable where m_id = ?";

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
	public List<MenuTable> getAll() {

		List<MenuTable> menu_list = new ArrayList<MenuTable>();

		sql = "select * from MenuTable";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<MenuTable>> rsh = new BeanListHandler<MenuTable>(MenuTable.class);
		try {
			menu_list = (ArrayList<MenuTable>) queryRunner.query(sql, rsh);
			// System.out.println("list" + menu_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return menu_list;

	}

	@Override
	public List<MenuTable> getOperation(String l_mid, int flag, String m_name) {
		List<MenuTable> menu_list = new ArrayList<MenuTable>();
		// 所有列表
		if (flag == 0) {

			sql = "select *  from  MenuTable  where l_mid = ?";
		}
		// 启用列表
		if (flag == 1) {

			sql = "select me.* from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ?  and m_state='启用') mt on mt.m_id = me.m_id ";
		}
		// 禁用列表
		if (flag == 2) {
			sql = "select me.* from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ? and m_state='禁用' ) mt on mt.m_id = me.m_id  ";

		}
		// 已删除列表
		if (flag == 3) {
			sql = "select me.* from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ? and m_state='已删除') mt on mt.m_id = me.m_id  ";
		}

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<MenuTable>> rsh = new BeanListHandler<>(MenuTable.class);
		try {
			menu_list = (ArrayList<MenuTable>) queryRunner.query(sql, rsh, l_mid);
			// System.out.println(l_mid);
			System.out.println("getOperation已分配" + menu_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu_list;
	}

	@Override
	public MenuTable findByIdAndName(String current_id, String m_name, String state) {
		MenuTable menuTable = new MenuTable();
		sql = "select * from  role_Menu WHERE 1 =1 ";
		String[] parma = {};
		if (current_id != null && (!current_id.equals(""))) {
			// System.out.println("current_id" + current_id);
			sql = sql + "and r_id =?";
			parma = Staff_TableImpl.insert(parma, current_id);

		}
		if (m_name != null && (!m_name.equals(""))) {
			// System.out.println("card" + card);
			sql = sql + " and m_name =  ?";
			parma = Staff_TableImpl.insert(parma, m_name);

		}
		if (state != null && (!state.equals(""))) {
			// System.out.println("d_id" + state);
			sql = sql + " and m_state=?";
			parma = Staff_TableImpl.insert(parma, state);
		}

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<MenuTable> rsh = new BeanHandler<MenuTable>(MenuTable.class);
		try {
			menuTable = queryRunner.query(sql, rsh, parma);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("menuTable+==");
		return menuTable;
	}

	@Override
	public boolean insetMenutree(String L_MID, String m_id, String state) {
		boolean flag = false;

		// 差之前先检查是否已经存在
		if (m_id != null && (!m_id.equals(""))) {

			try {
				sql = "Select * from  MENU_TREE where M_ID = ? and L_MID = ?";
				String[] param = new String[] { m_id, L_MID, state };
				String[] param1 = new String[] { m_id, L_MID };
				QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
				ResultSetHandler<MenuTable> rsh = new BeanHandler<MenuTable>(MenuTable.class);
				if (queryRunner.query(sql, rsh, param1) == null) {

					sql = "INSERT INTO MENU_TREE (M_ID, L_MID, MT_ID,m_state) " + "VALUES (?, ?, MT.nextval,?)";
					num = queryRunner.update(sql, param);

					if (num > 0) {
						flag = true;
						System.out.println("插入成功");
					} else {
						System.out.println("插入失败");
						flag = false;
					}
				} else {
					System.out.println("已经存在");
				}
				// System.out.println(sql + "m_id=" + m_id + "L_MID" + L_MID);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println("值进来为空");
		}
		return flag;

	}

	@Override
	public boolean removeMenutree(String m_id) {
		boolean flag = false;
		sql = "delete from MENU_TREE where m_id = ?";
		try {

			QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
			num = queryRunner.update(sql, m_id);

			if (num > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<MenuTable> findByName(String string) {

		List<MenuTable> menu_list = new ArrayList<MenuTable>();
		sql = "select * from menutable where l_mid = (select m_id from menutable where m_name = ?)";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<MenuTable>> rsh = new BeanListHandler<>(MenuTable.class);
		try {
			menu_list = (ArrayList<MenuTable>) queryRunner.query(sql, rsh, string);
			// System.out.println(l_mid);
			// System.out.println("getOperation已分配" + menu_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu_list;
	}

	@Override
	public List<MenuTable> findByIdAndState(String r_id, String string) {
		List<MenuTable> menu_list = new ArrayList<MenuTable>();

		sql = "select * from  role_Menu WHERE 1 =1 ";
		String[] parma = {};
		if (r_id != null && (!r_id.equals(""))) {
			// System.out.println("current_id" + current_id);
			sql = sql + "and r_id =?";
			parma = Staff_TableImpl.insert(parma, r_id);

		}
		if (string != null && (!string.equals(""))) {
			// System.out.println("card" + card);
			sql = sql + " and m_state =  ?";
			parma = Staff_TableImpl.insert(parma, string);

		}

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<MenuTable>> rsh = new BeanListHandler<>(MenuTable.class);
		try {
			menu_list = (ArrayList<MenuTable>) queryRunner.query(sql, rsh, parma);
			// System.out.println(l_mid);
			System.out.println("impl++++++ss" + menu_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu_list;
	}

	@Override
	public List<MenuTable> getname(String l_mid, int flag, String m_name) {
		List<MenuTable> menu_list = new ArrayList<MenuTable>();
		// 所有名字列表
		if (flag == 0) {

			sql = "select me. name from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ?) mt on mt.m_id = me.m_id ";
		}
		// 所有id列表
		if (flag == 0) {

			sql = "select me.m_id mid from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ?) mt on mt.m_id = me.m_id ";
		}
		// 启用列表
		if (flag == 1) {

			sql = "select me.* from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ?) mt on mt.m_id = me.m_id  and mt.mt.stat='启用'";
		}
		// 禁用列表
		if (flag == 2) {
			sql = "select me.* from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ?) mt on mt.m_id = me.m_id  and mt.mt.stat='禁用'";

		}
		// 已删除列表
		if (flag == 3) {
			sql = "select me.* from  MenuTable me right join ("
					+ "select m_id  from MENU_TREE  where l_mid = ?) mt on mt.m_id = me.m_id  and mt.mt.stat='已删除'";
		}

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<MenuTable>> rsh = new BeanListHandler<>(MenuTable.class);
		try {
			menu_list = (ArrayList<MenuTable>) queryRunner.query(sql, rsh, l_mid);
			// System.out.println(l_mid);
			// System.out.println("getOperation已分配" + menu_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu_list;
	}

	@Override
	public boolean changestate(String l_mid, String newstate, String oldstate, String m_id) {
		boolean falg = false;
		sql = "update  MENU_TREE  set m_state = ? where l_mid  = ? and M_state =? ";
		String[] param = { newstate, l_mid, oldstate };

		if (m_id != null && (!m_id.equals(""))) {
			// System.out.println("current_id" + current_id);
			sql = sql + "and m_id =?";
			param = Staff_TableImpl.insert(param, m_id);

		}

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		try {
			num = queryRunner.update(sql, param);
			System.out.println(sql + newstate + m_id + oldstate + l_mid);
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

}
