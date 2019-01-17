package org.great.entity;

public class Role_Menu {

	private int rol_id;// 编号
	private int r_id;// 角色编号
	private int m_id;// 菜单编号
	private int m_state;// 菜单状态

	

	public Role_Menu(int rol_id, int r_id, int m_id, int m_state) {
		super();
		this.rol_id = rol_id;
		this.r_id = r_id;
		this.m_id = m_id;
		this.m_state = m_state;
	}

	public Role_Menu() {
		super();
	}

	@Override
	public String toString() {
		return "Role_Menu [rol_id=" + rol_id + ", r_id=" + r_id + ", m_id=" + m_id + ", m_state=" + m_state + "]";
	}

	public int getRol_id() {
		return rol_id;
	}

	public void setRol_id(int rol_id) {
		this.rol_id = rol_id;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getM_state() {
		return m_state;
	}

	public void setM_state(int m_state) {
		this.m_state = m_state;
	}

}
