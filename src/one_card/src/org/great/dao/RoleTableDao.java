package org.great.dao;

import java.util.List;
import java.util.Map;

import org.great.entity.PresTable;
import org.great.entity.RoleTable;
import org.great.entity.Staff_Table;

public interface RoleTableDao extends BaseDao {
	public List<RoleTable> getAll();

	public RoleTable getr_name(String r_id);

}
