package org.great.dao;

import java.util.List;

import org.great.entity.PresTable;

public interface PresTableDao extends BaseDao {
	public List<PresTable> findByc_Id(String c_id, int currentPage, int pageCount);

	public int getTotalCount(String c_id);
}
