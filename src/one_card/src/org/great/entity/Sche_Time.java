package org.great.entity;

public class Sche_Time {
	private int t_today;// 编码
	private int t8_9;// 8:00-9:00 时间段预约病人的id
	private int t9_10;//
	private int t10_11;//
	private int t11_12;//
	private int t14_15;//
	private int t15_16;//
	private int t16_17;//
	private int t17_18;// 17:00-18:00

	public Sche_Time(int t_today, int t8_9, int t9_10, int t10_11, int t11_12, int t14_15, int t15_16, int t16_17,
			int t17_18) {
		super();
		this.t_today = t_today;
		this.t8_9 = t8_9;
		this.t9_10 = t9_10;
		this.t10_11 = t10_11;
		this.t11_12 = t11_12;
		this.t14_15 = t14_15;
		this.t15_16 = t15_16;
		this.t16_17 = t16_17;
		this.t17_18 = t17_18;
	}

	public int getT_today() {
		return t_today;
	}

	public void setT_today(int t_today) {
		this.t_today = t_today;
	}

	public int getT8_9() {
		return t8_9;
	}

	public void setT8_9(int t8_9) {
		this.t8_9 = t8_9;
	}

	public int getT9_10() {
		return t9_10;
	}

	public void setT9_10(int t9_10) {
		this.t9_10 = t9_10;
	}

	public int getT10_11() {
		return t10_11;
	}

	public void setT10_11(int t10_11) {
		this.t10_11 = t10_11;
	}

	public int getT11_12() {
		return t11_12;
	}

	public void setT11_12(int t11_12) {
		this.t11_12 = t11_12;
	}

	public int getT14_15() {
		return t14_15;
	}

	public void setT14_15(int t14_15) {
		this.t14_15 = t14_15;
	}

	public int getT15_16() {
		return t15_16;
	}

	public void setT15_16(int t15_16) {
		this.t15_16 = t15_16;
	}

	public int getT16_17() {
		return t16_17;
	}

	public void setT16_17(int t16_17) {
		this.t16_17 = t16_17;
	}

	public int getT17_18() {
		return t17_18;
	}

	public void setT17_18(int t17_18) {
		this.t17_18 = t17_18;
	}

	public Sche_Time() {
		super();
	}

	@Override
	public String toString() {
		return "Sche_Time [t_today=" + t_today + ", t8_9=" + t8_9 + ", t9_10=" + t9_10 + ", t10_11=" + t10_11
				+ ", t11_12=" + t11_12 + ", t14_15=" + t14_15 + ", t15_16=" + t15_16 + ", t16_17=" + t16_17
				+ ", t17_18=" + t17_18 + "]";
	}

}
