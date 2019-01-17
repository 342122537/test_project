package org.great.dao;

import java.util.List;

import org.great.entity.Card_msg;

public interface Card_msgDao extends BaseDao
{
	public Object findByc_Id(String  c_id) ;
	
	public boolean updateBalance(String  c_id,String newBalnce) ;
	public boolean updateState(String  c_id,String s_tate) ;
	public boolean rs_examine(String  c_id,String s_tate,String c_appid) ;
	public String quaryC_id(String  c_id1);
	public boolean chickC_id(String  c_id1);
	public String insertCard_msg(Card_msg card);
	public boolean findByc_Ids(String c_id1, String c_id2);
	public List<Card_msg> getAllList(Card_msg card, String currentPage, String pageCount);
	public int  getAllPage(Card_msg card, String currentPage, String pageCount);
	public List<Card_msg>  getC_id(String a_id);

	public boolean chickid(String begin_c_id, String id);

	public boolean chickstate(String newc_id, String string);
	
}
