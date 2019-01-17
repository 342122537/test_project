package org.great.entity;

public class ScheTable {
	private String sc_id;// 编号
	private String s_id;// 医生编号
	private int sc_date;// 日期

	public ScheTable(String sc_id, String s_id, int sc_date) {
		super();
		this.sc_id = sc_id;
		this.s_id = s_id;
		this.sc_date = sc_date;
	}

	public ScheTable() {
		super();
	}

	public String getSc_id() {
		return sc_id;
	}

	public void setSc_id(String sc_id) {
		this.sc_id = sc_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public int getSc_date() {
		return sc_date;
	}

	public void setSc_date(int sc_date) {
		this.sc_date = sc_date;
	}

	@Override
	public String toString() {
		return "ScheTable [sc_id=" + sc_id + ", s_id=" + s_id + ", sc_date=" + sc_date + "]";
	}

}
