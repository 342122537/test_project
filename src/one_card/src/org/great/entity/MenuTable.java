package org.great.entity;

public class MenuTable {
	private String m_id;// 菜单编号
	private String m_name;// 菜单名称
	private String m_url;// 链接路径
	private String l_mid;// 上级菜单编号
	private String m_state;// 菜单状态
	private String r_id;// 菜单状态
	private String mname;// 菜单状态
	private String mid;// 菜单状态

	public MenuTable(String m_id, String m_name, String m_url, String l_mid, String m_state, String r_id, String mname,
			String mid) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_url = m_url;
		this.l_mid = l_mid;
		this.m_state = m_state;
		this.r_id = r_id;
		this.mname = mname;
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public MenuTable(String m_id, String m_name, String m_url, String l_mid, String m_state, String r_id,
			String mt_state) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_url = m_url;
		this.l_mid = l_mid;
		this.m_state = m_state;
		this.r_id = r_id;
	}

	public MenuTable(String m_id, String m_name, String m_url, String l_mid, String m_state) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_url = m_url;
		this.l_mid = l_mid;
		this.m_state = m_state;
	}

	public MenuTable(String m_id, String m_name, String r_id) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.r_id = r_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_url() {
		return m_url;
	}

	public void setM_url(String m_url) {
		this.m_url = m_url;
	}

	public String getL_mid() {
		return l_mid;
	}

	public void setL_mid(String l_mid) {
		this.l_mid = l_mid;
	}

	public String getM_state() {
		return m_state;
	}

	public void setM_state(String m_state) {
		this.m_state = m_state;
	}

	@Override
	public String toString() {
		return "MenuTable [m_id=" + m_id + ", m_name=" + m_name + ", m_url=" + m_url + ", l_mid=" + l_mid + ", m_state="
				+ m_state + ", r_id=" + r_id + ", mname=" + mname + ", mid=" + mid + "]";
	}

	public MenuTable() {
		super();
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

}
