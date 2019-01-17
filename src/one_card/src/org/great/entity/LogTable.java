package org.great.entity;

public class LogTable {
	private String l_id;
	private String u_id;
	// private int s_id;
	private String l_time;
	private String l_even;

	// private String L_balance;
	public LogTable(String l_id, String u_id, String l_time, String l_even) {
		super();
		this.l_id = l_id;
		this.u_id = u_id;
		this.l_time = l_time;
		this.l_even = l_even;
	}

	public LogTable(String u_id, String l_time, String l_even) {
		super();
		this.u_id = u_id;
		this.l_time = l_time;
		this.l_even = l_even;
	}

	public LogTable() {
		super();
	}

	public String getL_id() {
		return l_id;
	}

	public void setL_id(String l_id) {
		this.l_id = l_id;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getL_time() {
		return l_time;
	}

	public void setL_time(String l_time) {
		this.l_time = l_time;
	}

	public String getL_even() {
		return l_even;
	}

	public void setL_even(String l_even) {
		this.l_even = l_even;
	}

	@Override
	public String toString() {
		return "LogTable [l_id=" + l_id + ", u_id=" + u_id + ", l_time=" + l_time + ", l_even=" + l_even + "]";
	}

}