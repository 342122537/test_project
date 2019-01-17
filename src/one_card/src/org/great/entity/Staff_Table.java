package org.great.entity;

public class Staff_Table {
	private String s_id;// 员工编号
	private String s_number;// 账号
	private String s_pwd;// 密码
	private String s_name;// 姓名
	private String s_keshi;// keshi
	private String s_state;// 状态
	private String r_id;// 角色编号
	private String r_name;// 角色编号
	private String d_name;// 角色编号

	private String registertime;// 注册时间

	public Staff_Table(String s_number, String s_pwd, String s_name, String s_keshi, String s_state, String r_id) {
		super();
		this.s_id = s_id;
		this.s_number = s_number;
		this.s_pwd = s_pwd;
		this.s_name = s_name;
		this.s_keshi = s_keshi;
		this.s_state = s_state;
		this.r_id = r_id;
	}
	
	public Staff_Table(String s_number, String s_name, String r_name, String d_name) {
		super();
		this.s_number = s_number;
		this.s_name = s_name;
		this.r_name = r_name;
		this.d_name = d_name;
	}

	public Staff_Table(String s_id, String s_number, String s_pwd, String s_name, String s_keshi, String s_state,
			String r_id, String registertime) {
		super();
		this.s_id = s_id;
		this.s_number = s_number;
		this.s_pwd = s_pwd;
		this.s_name = s_name;
		this.s_keshi = s_keshi;
		this.s_state = s_state;
		this.r_id = r_id;
		this.registertime = registertime;
	}

	public Staff_Table() {
		super();
	}

	public Staff_Table(String s_number, String s_keshi, String r_id) {
		super();
		this.s_number = s_number;
		this.s_keshi = s_keshi;
		this.r_id = r_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_number() {
		return s_number;
	}

	public void setS_number(String s_number) {
		this.s_number = s_number;
	}

	public String getS_pwd() {
		return s_pwd;
	}

	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_keshi() {
		return s_keshi;
	}

	public void setS_keshi(String s_keshi) {
		this.s_keshi = s_keshi;
	}

	public String getS_state() {
		return s_state;
	}

	public void setS_state(String s_state) {
		this.s_state = s_state;
	}

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getRegistertime() {
		return registertime;
	}

	public void setRegistertime(String registertime) {
		this.registertime = registertime;
	}

	@Override
	public String toString() {
		return "Staff_Table [s_id=" + s_id + ", s_number=" + s_number + ", s_pwd=" + s_pwd + ", s_name=" + s_name
				+ ", s_keshi=" + s_keshi + ", s_state=" + s_state + ", r_id=" + r_id + ", registertime=" + registertime
				+ "]";
	}

}
