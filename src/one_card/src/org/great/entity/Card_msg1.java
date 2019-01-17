package org.great.entity;

public class Card_msg1 {
	String c_id;
	String c_leader;
	String c_leaadTime;
	String c_seller;
	String c_sellTime;
	String C1_Id;
	String c_balance;
	String p_name;
	String c_state;
	Card_msg card_msg;
	PatientTable patientTable;

	public Card_msg1(String c_id, String c_leader, String c_leaadTime, String c_seller, String c_sellTime, String c1_Id,
			String c_balance, String p_name) {
		super();
		this.c_id = c_id;
		this.c_leader = c_leader;
		this.c_leaadTime = c_leaadTime;
		this.c_seller = c_seller;
		this.c_sellTime = c_sellTime;
		C1_Id = c1_Id;
		this.c_balance = c_balance;
		this.p_name = p_name;
	}

	public Card_msg1(String c_id, String c_leader, String c_leaadTime, String c_seller, String c_sellTime,
			String c_state) {
		super();
		this.c_id = c_id;
		this.c_leader = c_leader;
		this.c_leaadTime = c_leaadTime;
		this.c_seller = c_seller;
		this.c_sellTime = c_sellTime;
		this.c_state = c_state;
	}

	public Card_msg1(String c_id, String c_leader, String c_state) {
		super();
		this.c_id = c_id;
		this.c_leader = c_leader;
		this.c_state = c_state;
	}

	public Card_msg1(String c_id, String c_leader, String c_leaadTime, String c_seller, String c_sellTime) {
		super();
		this.c_id = c_id;
		this.c_leader = c_leader;
		this.c_leaadTime = c_leaadTime;
		this.c_seller = c_seller;
		this.c_sellTime = c_sellTime;
	}

	public Card_msg1() {
		super();
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_leader() {
		return c_leader;
	}

	public void setC_leader(String c_leader) {
		this.c_leader = c_leader;
	}

	public String getC_leaadTime() {
		return c_leaadTime;
	}

	public void setC_leaadTime(String c_leaadTime) {
		this.c_leaadTime = c_leaadTime;
	}

	public String getC_seller() {
		return c_seller;
	}

	public void setC_seller(String c_seller) {
		this.c_seller = c_seller;
	}

	public String getC_sellTime() {
		return c_sellTime;
	}

	public void setC_sellTime(String c_sellTime) {
		this.c_sellTime = c_sellTime;
	}

	public String getC1_Id() {
		return C1_Id;
	}

	public void setC1_Id(String c1_Id) {
		C1_Id = c1_Id;
	}

	public String getC_balance() {
		return c_balance;
	}

	public void setC_balance(String c_balance) {
		this.c_balance = c_balance;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getS_state() {
		return c_state;
	}

	public void setS_state(String s_state) {
		this.c_state = s_state;
	}

	@Override
	public String toString() {
		return "card_msg1 [c_id=" + c_id + ", c_leader=" + c_leader + ", c_leaadTime=" + c_leaadTime + ", c_seller="
				+ c_seller + ", c_sellTime=" + c_sellTime + ", C1_Id=" + C1_Id + ", c_balance=" + c_balance
				+ ", p_name=" + p_name + "]";
	}

	public String getC_state() {
		return c_state;
	}

	public void setC_state(String c_state) {
		this.c_state = c_state;
	}

}
