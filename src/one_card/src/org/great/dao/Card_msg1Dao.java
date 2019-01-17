package org.great.dao;

import java.util.List;
import java.util.Map;

import org.great.entity.Card_msg;
import org.great.entity.Card_msg1;

public interface Card_msg1Dao extends BaseDao {
	public Object findByc_Id(String c_id);

	public boolean updateBalance(String c_id, String newBalnce);

	public boolean updateState(String c_id, String s_tate);

	public String quaryC_id(String c_id1);

	public String insertCard_msg(Card_msg1 card);

	public boolean findByc_Ids(String c_id1, String c_id2);

	public List<Map<String, Object>> getAllList(Card_msg1 card, String currentPage, String pageCount);

	public int getAllPage(Card_msg1 card, String currentPage, String pageCount);

}
