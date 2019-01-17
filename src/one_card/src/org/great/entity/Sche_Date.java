package org.great.entity;

public class Sche_Date {
	private int sc_time;// 编码
	private int d_man;// 周一
	private int d_tue;// 周二
	private int d_wed;// 周三
	private int d_thu;// 周四
	private int d_fri;// 周五
	private int d_sat;// 周六
	private int d_sun;// 周日

	public Sche_Date(int sc_time, int d_man, int d_tue, int d_wed, int d_thu, int d_fri, int d_sat, int d_sun) {
		super();
		this.sc_time = sc_time;
		this.d_man = d_man;
		this.d_tue = d_tue;
		this.d_wed = d_wed;
		this.d_thu = d_thu;
		this.d_fri = d_fri;
		this.d_sat = d_sat;
		this.d_sun = d_sun;
	}

	public Sche_Date() {
		super();
	}

	public int getSc_time() {
		return sc_time;
	}

	public void setSc_time(int sc_time) {
		this.sc_time = sc_time;
	}

	public int getD_man() {
		return d_man;
	}

	public void setD_man(int d_man) {
		this.d_man = d_man;
	}

	public int getD_tue() {
		return d_tue;
	}

	public void setD_tue(int d_tue) {
		this.d_tue = d_tue;
	}

	public int getD_wed() {
		return d_wed;
	}

	public void setD_wed(int d_wed) {
		this.d_wed = d_wed;
	}

	public int getD_thu() {
		return d_thu;
	}

	public void setD_thu(int d_thu) {
		this.d_thu = d_thu;
	}

	public int getD_fri() {
		return d_fri;
	}

	public void setD_fri(int d_fri) {
		this.d_fri = d_fri;
	}

	public int getD_sat() {
		return d_sat;
	}

	public void setD_sat(int d_sat) {
		this.d_sat = d_sat;
	}

	public int getD_sun() {
		return d_sun;
	}

	public void setD_sun(int d_sun) {
		this.d_sun = d_sun;
	}

	@Override
	public String toString() {
		return "Sche_Date [sc_time=" + sc_time + ", d_man=" + d_man + ", d_tue=" + d_tue + ", d_wed=" + d_wed
				+ ", d_thu=" + d_thu + ", d_fri=" + d_fri + ", d_sat=" + d_sat + ", d_sun=" + d_sun + "]";
	}
	
}
