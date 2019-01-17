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
import org.great.entity.DeptTable;
import org.great.entity.PatientTable;
import org.great.entity.PresTable;
import org.great.entity.Staff_Table;
import org.great.tools.ConnectionUtil;

import com.sun.org.apache.bcel.internal.generic.Select;

import oracle.net.aso.f;
import oracle.net.aso.l;
import oracle.net.aso.p;

public class Staff_TableImpl implements Staff_TableDao {

	private String sql = null;
	private boolean flag = false;
	private int num = 0;

	@Override
	public boolean insertObject(Object obj) {
		Staff_Table staff_Table = (Staff_Table) obj;
		boolean flag = false;
		try {
			QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

			sql = "insert into Staff_Table(S_ID,S_NUMBER,S_PWD,S_NAME,S_KESHI,S_STATE,R_Id)"
					+ " values(staff.Nextval,?,?,?,?,?,?) ";
			String[] param = new String[] { staff_Table.getS_number(), staff_Table.getS_pwd(), staff_Table.getS_name(),
					staff_Table.getS_keshi(), staff_Table.getS_state(), staff_Table.getR_id() };

			num = queryRunner.update(sql, param);

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
		boolean falg = false;
		Staff_Table staff_Table = (Staff_Table) obj;
		sql = "update Staff_Table set r_id = ?,s_keshi= ? where s_number =?";

		num = -1;

		String[] param = new String[] { staff_Table.getR_id(), staff_Table.getS_keshi(), staff_Table.getS_number() };

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
		Staff_Table staff_Table = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		ResultSetHandler<Staff_Table> rsh = new BeanHandler<Staff_Table>(Staff_Table.class);
		sql = " select * from Staff_Table where s_number = ?";
		try {
			staff_Table = queryRunner.query(sql, rsh, id);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("staff_Table+" + staff_Table);

		return staff_Table;
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
	public List<Staff_Table> findByc_Id(String c_id, int currentPage, int pageCount) {

		return null;

	}

	@Override
	public String getpwd(String s_number) {

		String pwd = null;
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();
		sql = "select s_pwd FROM Staff_Table where s_number= '" + s_number + "'";
		// ResultSetHandler<SaleRule> rsh = new BeanHandler<SaleRule+>(SaleRule.class);

		ResultSetHandler rsh = new ScalarHandler();
		try {
			pwd = (String) queryRunner.query(sql, rsh);
			System.out.println("pwd=" + pwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return pwd;
	}

	@Override
	public Staff_Table updateStaff_Table(Staff_Table staff_Table) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> findAAL(String s_name, String d_id, String r_id, String s_state, int currentPage,
			int pageCount) {
		String[] parma = {};
		List<Map<String, Object>> query = null;

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		sql = "select * from (SELECT ROWNUM R,t1.* From "
				+ "( select srt.s_number,srt.s_name,srt.r_name, dt.d_name ,srt.s_state ,srt.s_id from ";
		sql = sql + ""
				+ "( SELECT st.s_number,st.s_name,rt.r_name, rt.d_id ,st.s_state,st.s_id from Staff_Table st  left join RoleTable rt on rt.r_id = st.r_id where st.s_state !='已删除' ";
		if (s_name != null && (!s_name.equals(""))) {
			System.out.println("s_name" + s_name);
			sql = sql + " and st.s_name =  ?";
			parma = insert(parma, s_name);

		}
		if (r_id != null && (!r_id.equals(""))) {
			System.out.println("r_id" + r_id);
			sql = sql + " and rt.r_id =  ?";
			parma = insert(parma, r_id);

		}
		if (d_id != null && (!d_id.equals(""))) {
			System.out.println("d_id" + d_id);
			sql = sql + " and rt.d_id =  ?";
			parma = insert(parma, d_id);

		}
		sql = sql + ") srt   left join  DeptTable dt on srt.d_id = dt.d_id where 1=1 ";

		if (s_state != null && (!s_state.equals(""))) {
			System.out.println("s_state" + s_state);
			sql = sql + " and srt.s_state =  ?";
			parma = insert(parma, s_state);

		}
		sql = sql + ")t1 where rownum < ?" + " ) t2 Where t2.R > ? ";

		int minrow = currentPage * pageCount - pageCount;
		int max = 1 + currentPage * pageCount;
		parma = insert(parma, "" + max);
		parma = insert(parma, "" + minrow);

		try {
			query = queryRunner.query(sql, new MapListHandler(), parma);
			System.out.println("list=" + query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
	}

	public static String[] insert(String[] arr, String str) {
		int size = arr.length;
		String[] tmp = new String[size + 1];
		System.arraycopy(arr, 0, tmp, 0, size);
		tmp[size] = str;
		// System.out.println(tmp);
		return tmp;
	}

	@Override
	public int getTotalCount(String s_name, String s_keshi, String r_id, String s_state) {

		String[] parma = {};
		int tatal = 0;

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		sql = "SELECT count(*) From " + "( select  dt.d_name ,srt.s_state from ";
		sql = sql + ""
				+ "( SELECT rt.d_id ,st.s_state from Staff_Table st  left join RoleTable rt on rt.r_id = st.r_id where 1=1 ";
		if (s_name != null && (!s_name.equals(""))) {
			System.out.println("s_name" + s_name);
			sql = sql + " and st.s_name =  ?";
			parma = insert(parma, s_name);

		}
		if (r_id != null && (!r_id.equals(""))) {
			System.out.println("r_id" + r_id);
			sql = sql + " and st.r_id =  ?";
			parma = insert(parma, r_id);

		}

		sql = sql + ") srt   left join  DeptTable dt on srt.d_id = dt.d_id where 1=1 ";
		if (s_keshi != null && (!s_keshi.equals(""))) {
			System.out.println("s_keshi" + s_keshi);
			sql = sql + " and dt.d_id =  ?";
			parma = insert(parma, s_keshi);

		}
		if (s_state != null && (!s_state.equals(""))) {
			System.out.println("s_state" + s_state);
			sql = sql + " and srt.s_state =  ?";
			parma = insert(parma, s_state);

		}

		sql = sql + ")";
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
	public boolean updatepwd(String s_nummber, String s_pwd) {
		boolean falg = false;

		sql = "update Staff_Table set s_pwd = ? where s_number =?";

		num = -1;

		String[] param = new String[] { s_pwd, s_nummber };

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
	public boolean updateState(String s_nummber, String s_state) {
		boolean falg = false;

		sql = "update Staff_Table set	s_state = ? where s_number =?";

		num = -1;

		String[] param = new String[] { s_state, s_nummber };

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
	public List<Staff_Table> getApplyer() {
		ArrayList<Staff_Table> list = new ArrayList<Staff_Table>();

		sql = "select s_name from Staff_Table where r_id ='003'";

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<Staff_Table>> rsh = new BeanListHandler<Staff_Table>(Staff_Table.class);
		try {
			list = (ArrayList<Staff_Table>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<Staff_Table> finByName(String s_name, String currentPage, String string) {
		ArrayList<Staff_Table> list = new ArrayList<Staff_Table>();
		String[] parma = {};
		String sql = "select * from (SELECT ROWNUM R,t1.* From (select * from staff_table where 1= 1";

		if (s_name != null && (!s_name.equals(""))) {
			sql += " and s_name = ?";
			parma = insert(parma, s_name);

		}
		sql = sql + ")t1 where rownum < ?" + " ) t2 Where t2.R > ? ";
		int minrow = Integer.parseInt(currentPage) * 5 - 5;
		int max = 1 + Integer.parseInt(currentPage) * 5;
		parma = insert(parma, "" + max);
		parma = insert(parma, "" + minrow);

		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<Staff_Table>> rsh = new BeanListHandler<Staff_Table>(Staff_Table.class);
		try {
			list = (ArrayList<Staff_Table>) queryRunner.query(sql, rsh, parma);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Staff_Table> getDeptList(String string) {
		List<Staff_Table> list = new ArrayList<Staff_Table>();

		sql = "select * from staff_table where s_keshi =(select d_id from depttable where d_name = ? )";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<Staff_Table>> rsh = new BeanListHandler<Staff_Table>(Staff_Table.class);
		try {
			list = (ArrayList<Staff_Table>) queryRunner.query(sql, rsh, string);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Staff_Table> findAlls() {
		List<Staff_Table> list = new ArrayList<Staff_Table>();
		sql = "select * from Staff_Table where s_state !='已删除'";
		QueryRunner queryRunner = ConnectionUtil.getQueryRunner();

		ResultSetHandler<List<Staff_Table>> rsh = new BeanListHandler<Staff_Table>(Staff_Table.class);
		try {
			list = (ArrayList<Staff_Table>) queryRunner.query(sql, rsh);
			System.out.println("list" + list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
