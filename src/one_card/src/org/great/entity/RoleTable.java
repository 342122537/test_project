package org.great.entity;

public class RoleTable {

	private String r_id;// 角色编号
	private String r_name;// 角色名称
	private String d_id;// 科室编号
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public RoleTable(String r_id, String r_name, String d_id) {
		super();
		this.r_id = r_id;
		this.r_name = r_name;
		this.d_id = d_id;
	}
	public RoleTable() {
		super();
	}
	@Override
	public String toString() {
		return "RoleTable [r_id=" + r_id + ", r_name=" + r_name + ", d_id=" + d_id + "]";
	}
		
}
