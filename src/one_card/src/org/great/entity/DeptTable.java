package org.great.entity;

public class DeptTable {
	private String d_id;// 科室编号
	private String d_name;// 科室名称
	private String d_type;// 科室名称
	public DeptTable(String d_id, String d_name, String d_type) {
		super();
		this.d_id = d_id;
		this.d_name = d_name;
		this.d_type = d_type;
	}
	public DeptTable() {
		super();
	}
	@Override
	public String toString() {
		return "DeptTable [d_id=" + d_id + ", d_name=" + d_name + ", d_type=" + d_type + "]";
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_type() {
		return d_type;
	}
	public void setD_type(String d_type) {
		this.d_type = d_type;
	}

	
}
