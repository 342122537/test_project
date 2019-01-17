package org.great.dao;

import java.util.List;

import org.great.entity.MenuTable;

public interface MemuTableDao extends BaseDao {

	public List<MenuTable> getAll();

	public List<MenuTable> getOperation(String op_id, int state, String name);

	public MenuTable findByIdAndName(String current_id, String card, String system);

	public boolean insetMenutree(String current_id, String m_id, String state);

	public boolean removeMenutree(String m_id);

	public List<MenuTable> findByName(String string);

	public List<MenuTable> findByIdAndState(String r_id, String string);

	public List<MenuTable> getname(String m_id, int i, String m_name);

	public boolean changestate(String ml_mid_id, String newstate, String oldstate, String m_id);

	// public List<MenuTable> getManage(String string);

}
