package org.great.dao;

import java.util.List;
import java.util.Map;

import org.great.entity.PresTable;
import org.great.entity.Staff_Table;

public interface Staff_TableDao extends BaseDao {
	public List<Staff_Table> findByc_Id(String c_id, int currentPage, int pageCount);

	public int getTotalCount(String s_name, String s_keshi, String r_id, String s_state);

	public String getpwd(String c_id);

	public Staff_Table updateStaff_Table(Staff_Table staff_Table);

	public boolean updatepwd(String s_nummber, String s_pwd);

	public boolean updateState(String s_nummber, String s_state);

	public List<Map<String, Object>> findAAL(String s_name, String s_keshi, String r_id, String s_state,
			int currentPage, int pageCount);

	public List<Staff_Table> getApplyer();

	public List<Staff_Table> finByName(String s_name, String currentPage, String string);

	public List<Staff_Table> getDeptList(String string);

	public List<Staff_Table> findAlls();
}
