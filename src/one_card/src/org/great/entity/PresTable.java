package org.great.entity;

public class PresTable {
	private String p_id;// 编号
	private String s_id;// 卡编号
	private String c_id;// yisheng编号
	private String p_name;// 药品名称
	private String p_take;// 服用方式
	private String p_number;// 数量
	private String p_unit;// 单位
	private String P_price;// 单价
	private String p_total;// 小计

	public PresTable(String p_id, String s_id, String c_id, String p_name, String p_take, String p_number,
			String p_unit, String p_price, String p_total) {
		super();
		this.p_id = p_id;
		this.s_id = s_id;
		this.c_id = c_id;
		this.p_name = p_name;
		this.p_take = p_take;
		this.p_number = p_number;
		this.p_unit = p_unit;
		P_price = p_price;
		this.p_total = p_total;
	}

	@Override
	public String toString() {
		return "presTable [p_id=" + p_id + ", s_id=" + s_id + ", c_id=" + c_id + ", p_name=" + p_name + ", p_take="
				+ p_take + ", p_number=" + p_number + ", p_unit=" + p_unit + ", P_price=" + P_price + ", p_total="
				+ p_total + "]";
	}

	public PresTable() {
		super();
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
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

	public String getP_take() {
		return p_take;
	}

	public void setP_take(String p_take) {
		this.p_take = p_take;
	}

	public String getP_number() {
		return p_number;
	}

	public void setP_number(String p_number) {
		this.p_number = p_number;
	}

	public String getP_unit() {
		return p_unit;
	}

	public void setP_unit(String p_unit) {
		this.p_unit = p_unit;
	}

	public String getP_price() {
		return P_price;
	}

	public void setP_price(String p_price) {
		P_price = p_price;
	}

	public String getP_total() {
		return p_total;
	}

	public void setP_total(String p_total) {
		this.p_total = p_total;
	}

}
