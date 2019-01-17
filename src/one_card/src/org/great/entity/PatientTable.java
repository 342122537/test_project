package org.great.entity;

public class PatientTable {
	private String c_id;
	private String p_name;
	private String p_sex;
	private String p_age;
	private String p_city;
	private String p_idcard;
	private String p_phone;
	private String p_address;
	private String c_balance;
	private String c_deposit;

	public PatientTable(String c_id, String p_name, String p_sex, String p_age, String p_city, String p_idcard,
			String p_phone, String p_address, String c_balance, String c_deposit) {
		super();
		this.c_id = c_id;
		this.p_name = p_name;
		this.p_sex = p_sex;
		this.p_age = p_age;
		this.p_city = p_city;
		this.p_idcard = p_idcard;
		this.p_phone = p_phone;
		this.p_address = p_address;
		this.c_balance = c_balance;
		this.c_deposit = c_deposit;
	}

	public String getC_balance() {
		return c_balance;
	}

	public void setC_balance(String c_balance) {
		this.c_balance = c_balance;
	}

	public String getC_deposit() {
		return c_deposit;
	}

	public void setC_deposit(String c_deposit) {
		this.c_deposit = c_deposit;
	}

	public PatientTable() {
		super();
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_sex() {
		return p_sex;
	}

	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
	}

	public String getP_age() {
		return p_age;
	}

	public void setP_age(String p_age) {
		this.p_age = p_age;
	}

	public String getP_city() {
		return p_city;
	}

	public void setP_city(String p_city) {
		this.p_city = p_city;
	}

	public String getP_idcard() {
		return p_idcard;
	}

	public void setP_idcard(String p_idcard) {
		this.p_idcard = p_idcard;
	}

	public String getP_phone() {
		return p_phone;
	}

	public void setP_phone(String p_phone) {
		this.p_phone = p_phone;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	@Override
	public String toString() {
		return "PatientTable [c_id=" + c_id + ", p_name=" + p_name + ", p_sex=" + p_sex + ", p_age=" + p_age
				+ ", p_city=" + p_city + ", p_idcard=" + p_idcard + ", p_phone=" + p_phone + ", p_address=" + p_address
				+ "]";
	}

}
