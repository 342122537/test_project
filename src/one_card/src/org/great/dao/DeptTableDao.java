package org.great.dao;

import java.util.List;
import java.util.Map;

import org.great.entity.DeptTable;
import org.great.entity.PresTable;
import org.great.entity.Staff_Table;

public interface DeptTableDao extends BaseDao {
	public List<DeptTable> getAll();

	public DeptTable getr_name(String d_id);

}