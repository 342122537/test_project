package org.great.dao;

import java.util.List;

import org.great.entity.ApplyTable;
import org.great.entity.Card_Event;

public interface ApplyTableDao extends BaseDao
{
	public List<ApplyTable> findByc_Id(String  c_id) ;
	public boolean updateNumber(String  c_id,String newnumber) ;
	public boolean updatestate(String  c_id,String state) ;
	public List<ApplyTable> getAll(ApplyTable applyTable , String currentPage, String pageCount );
	public List<ApplyTable> allTogetherList(ApplyTable applyTable , String currentPage, String pageCount, String s_number );
	public int  getcount(ApplyTable applyTable);
	public int  allTogetherListcount(ApplyTable applyTable, String s_number);
}
