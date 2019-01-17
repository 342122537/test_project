package org.great.entity;

public class Menu_tree {
	String mt_id;
	String m_id;
	String l_mid;

	public Menu_tree(String mt_id, String m_id, String l_mid) {
		super();
		this.mt_id = mt_id;
		this.m_id = m_id;
		this.l_mid = l_mid;
	}

	@Override
	public String toString() {
		return "Menu_tree [mt_id=" + mt_id + ", m_id=" + m_id + ", l_mid=" + l_mid + "]";
	}

	public String getMt_id() {
		return mt_id;
	}

	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getL_mid() {
		return l_mid;
	}

	public void setL_mid(String l_mid) {
		this.l_mid = l_mid;
	}

	public Menu_tree() {
		super();
	}

}
