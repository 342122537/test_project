package org.great.entity;

public class ApplyTable {

	String a_id;
	String c_id;
	String a_auditor;// 审核人
	String a_autime;// 审核时间
	String c_applyer;// 申请人
	String c_imptime;// 申请时间
	String a_appNumber;// 申请数量
	// String c_appid;// 识别id
	String state;// 状态

	String applyTime1;// 查询申请时间1
	String applyTime2;// 查询申请时间2
	String c_id1;// 开始c_id
	String c_id2;// 结束_c_d

	String p_name;// 结束_c_d
	String c_balance;// 结束_c_d
	String c_state;// 结束_c_d

	public ApplyTable(String a_id, String c_id, String a_auditor, String a_autime, String c_applyer, String c_imptime,
			String a_appNumber, String state, String applyTime1, String applyTime2, String c_id1, String c_id2,
			String p_name, String c_balance, String c_state) {
		super();
		this.a_id = a_id;
		this.c_id = c_id;
		this.a_auditor = a_auditor;
		this.a_autime = a_autime;
		this.c_applyer = c_applyer;
		this.c_imptime = c_imptime;
		this.a_appNumber = a_appNumber;
		this.state = state;
		this.applyTime1 = applyTime1;
		this.applyTime2 = applyTime2;
		this.c_id1 = c_id1;
		this.c_id2 = c_id2;
		this.p_name = p_name;
		this.c_balance = c_balance;
		this.c_state = c_state;
	}

	public ApplyTable(String a_id, String a_auditor, String a_autime, String c_applyer, String c_imptime,
			String a_appNumber, String state) {
		super();
		this.a_id = a_id;
		this.a_auditor = a_auditor;
		this.a_autime = a_autime;
		this.c_applyer = c_applyer;
		this.c_imptime = c_imptime;
		this.a_appNumber = a_appNumber;
		this.state = state;
	}

	public ApplyTable(String applyTime1, String applyTime2, String c_id1, String c_id2, String state) {
		super();
		this.applyTime1 = applyTime1;
		this.applyTime2 = applyTime2;
		this.c_id1 = c_id1;
		this.c_id2 = c_id2;
		this.state = state;
	}

	public String getC_id1() {
		return c_id1;
	}

	public void setC_id1(String c_id1) {
		this.c_id1 = c_id1;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getC_balance() {
		return c_balance;
	}

	public void setC_balance(String c_balance) {
		this.c_balance = c_balance;
	}

	public String getC_state() {
		return c_state;
	}

	public void setC_state(String c_state) {
		this.c_state = c_state;
	}

	public String getC_id2() {
		return c_id2;
	}

	public void setC_id2(String c_id2) {
		this.c_id2 = c_id2;
	}

	public ApplyTable(String c_auditor, String c_autime, String c_applyer, String c_imptime, String a_appNumber,
			String state) {
		super();
		this.a_auditor = c_auditor;
		this.a_autime = c_autime;
		this.c_applyer = c_applyer;
		this.c_imptime = c_imptime;
		this.a_appNumber = a_appNumber;
		this.state = state;
	}

	public ApplyTable(String state, String applyTime1, String applyTime2, String c_applyer) {
		super();
		this.state = state;
		this.applyTime1 = applyTime1;
		this.applyTime2 = applyTime2;
		this.c_applyer = c_applyer;
	}

	@Override
	public String toString() {
		return "ApplyTable [a_id=" + a_id + ", c_id=" + c_id + ", a_auditor=" + a_auditor + ", a_autime=" + a_autime
				+ ", c_applyer=" + c_applyer + ", c_imptime=" + c_imptime + ", a_appNumber=" + a_appNumber + ", state="
				+ state + ", applyTime1=" + applyTime1 + ", applyTime2=" + applyTime2 + ", c_id1=" + c_id1 + ", c_id2="
				+ c_id2 + ", p_name=" + p_name + ", c_balance=" + c_balance + ", c_state=" + c_state + "]";
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getA_auditor() {
		return a_auditor;
	}

	public void setA_auditor(String a_auditor) {
		this.a_auditor = a_auditor;
	}

	public String getA_autime() {
		return a_autime;
	}

	public void setA_autime(String a_autime) {
		this.a_autime = a_autime;
	}

	public String getC_applyer() {
		return c_applyer;
	}

	public void setC_applyer(String c_applyer) {
		this.c_applyer = c_applyer;
	}

	public String getC_imptime() {
		return c_imptime;
	}

	public void setC_imptime(String c_imptime) {
		this.c_imptime = c_imptime;
	}

	public String getA_appNumber() {
		return a_appNumber;
	}

	public void setA_appNumber(String a_appNumber) {
		this.a_appNumber = a_appNumber;
	}

	public ApplyTable() {
		super();
	}

	public String getApplyTime1() {
		return applyTime1;
	}

	public void setApplyTime1(String applyTime1) {
		this.applyTime1 = applyTime1;
	}

	public String getApplyTime2() {
		return applyTime2;
	}

	public void setApplyTime2(String applyTime2) {
		this.applyTime2 = applyTime2;
	}

}
