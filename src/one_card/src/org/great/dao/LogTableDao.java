package org.great.dao;

import java.util.List;

import org.great.entity.LogTable;

public interface LogTableDao extends BaseDao{

	public int getTotalCount(String time1 , String time2 );
	public int getCount(String s_name , String event,String time1,String time2 );

	public List<LogTable> getAllList(String currentPage, int pageCount, String time1, String time2);

}
