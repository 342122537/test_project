package org.great.entity;

public class Card_Event {
	private int E_id;// 编号
	private String c_id;// 卡编号
	private String e_event;// 操作事件
	private String e_time;// 操作时间
	private String e_money;// fasheng jine
	private String s_id;// 执行人
	
	public Card_Event(String c_id, String e_event, String e_time, String e_money, String s_id) {
		super();
		this.c_id = c_id;
		this.e_event = e_event;
		this.e_time = e_time;
		this.e_money = e_money;
		this.s_id = s_id;
	}

	public int getE_id() {
		return E_id;
	}

	public void setE_id(int e_id) {
		E_id = e_id;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getE_event() {
		return e_event;
	}

	public void setE_event(String e_event) {
		this.e_event = e_event;
	}

	public String getE_time() {
		return e_time;
	}

	public void setE_time(String e_time) {
		this.e_time = e_time;
	}

	public String getE_money() {
		return e_money;
	}

	public void setE_money(String e_money) {
		this.e_money = e_money;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public Card_Event(int e_id, String c_id, String e_event, String e_time, String e_money, String s_id) {
		super();
		E_id = e_id;
		this.c_id = c_id;
		this.e_event = e_event;
		this.e_time = e_time;
		this.e_money = e_money;
		this.s_id = s_id;
	}

	public Card_Event() {
		super();
	}

	@Override
	public String toString() {
		return "Card_Event [E_id=" + E_id + ", c_id=" + c_id + ", e_event=" + e_event + ", e_time=" + e_time
				+ ", e_money=" + e_money + ", s_id=" + s_id + "]";
	}

}