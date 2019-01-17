package org.great.entity;

public class Card_msg {
	private String c_id;
	private String c_prefix;
	private String c_number;
	private String c_state;
	private String c_imptime;
	private String c_applyer;
	private String c_appNumber;
	private String c_appid;

	
	private String c_id1;
	private String c_id2;

	private String time1;
	private String time2;

	public Card_msg() {
		super();
	}

	
	
	public Card_msg(String c_id, String c_prefix, String c_number, String c_state, String c_imptime, String c_applyer,
			String c_appid) {
		super();
		this.c_id = c_id;
		this.c_prefix = c_prefix;
		this.c_number = c_number;
		this.c_state = c_state;
		this.c_imptime = c_imptime;
		this.c_applyer = c_applyer;
		this.c_appid = c_appid;
	}



	public Card_msg(String c_state, String c_id1, String c_id2, String time1, String time2) {
		super();
		this.c_state = c_state;
		this.c_id1 = c_id1;
		this.c_id2 = c_id2;
		this.time1 = time1;
		this.time2 = time2;
	}

	public Card_msg(String c_state, String c_id1, String c_id2) {
		super();
		this.c_state = c_state;
		this.c_id1 = c_id1;
		this.c_id2 = c_id2;

	}
	public String getC_appid() {
		return c_appid;
	}

	public void setC_appid(String c_appid) {
		this.c_appid = c_appid;
	}

	public String getC_id1() {
		return c_id1;
	}

	public void setC_id1(String c_id1) {
		this.c_id1 = c_id1;
	}

	public String getC_id2() {
		return c_id2;
	}

	public void setC_id2(String c_id2) {
		this.c_id2 = c_id2;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	@Override
	public String toString() {
		return "Card_msg [c_id=" + c_id + ", c_prefix=" + c_prefix + ", c_number=" + c_number + ", c_state=" + c_state
				+ ", c_imptime=" + c_imptime + ", c_applyer=" + c_applyer + ", c_appNumber=" + c_appNumber + ", c_id1="
				+ c_id1 + ", c_id2=" + c_id2 + ", time1=" + time1 + ", time2=" + time2 + "]";
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_prefix() {
		return c_prefix;
	}

	public void setC_prefix(String c_prefix) {
		this.c_prefix = c_prefix;
	}

	public String getC_number() {
		return c_number;
	}

	public void setC_number(String c_number) {
		this.c_number = c_number;
	}

	public String getC_state() {
		return c_state;
	}

	public void setC_state(String c_state) {
		this.c_state = c_state;
	}

	public String getC_imptime() {
		return c_imptime;
	}

	public void setC_imptime(String c_imptime) {
		this.c_imptime = c_imptime;
	}

	public String getC_applyer() {
		return c_applyer;
	}

	public void setC_applyer(String c_applyer) {
		this.c_applyer = c_applyer;
	}

	public String getC_appNumber() {
		return c_appNumber;
	}

	public void setC_appNumber(String c_appNumber) {
		this.c_appNumber = c_appNumber;
	}

}
