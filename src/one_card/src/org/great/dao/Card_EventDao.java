package org.great.dao;

import java.util.List;

import org.great.entity.Card_Event;

public interface Card_EventDao extends BaseDao
{
	public List<Card_Event> findByc_Id(String  c_id) ;
	public boolean updateBalance(String  c_id,String newBalnce) ;

}
