package org.great.entity;

public class Appointment_Table {

	private String app_id;// 挂号编号
	private String sc_id;// 排班编号
	private String app_state;// 取号状态
	private String p_id;// 病人编号
	private String app_time;// 预约时间
	private String doc_date;// 门诊日期
	private String doc_time;// 门诊时间
	private String doc_name;// 医生
	private String p_name;// 病人
	private String doc_dept;// 科室

	public String getDoc_date() {
		return doc_date;
	}

	public void setDoc_date(String doc_date) {
		this.doc_date = doc_date;
	}

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getSc_id() {
		return sc_id;
	}

	public void setSc_id(String sc_id) {
		this.sc_id = sc_id;
	}

	public String getApp_state() {
		return app_state;
	}

	public void setApp_state(String app_state) {
		this.app_state = app_state;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getApp_time() {
		return app_time;
	}

	public void setApp_time(String app_time) {
		this.app_time = app_time;
	}

	public String getDoc_time() {
		return doc_time;
	}

	public void setDoc_time(String doc_time) {
		this.doc_time = doc_time;
	}

	public String getDoc_name() {
		return doc_name;
	}

	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getDoc_dept() {
		return doc_dept;
	}

	public void setDoc_dept(String doc_dept) {
		this.doc_dept = doc_dept;
	}

	public Appointment_Table() {
		super();
	}

	public Appointment_Table(String app_id, String app_state, String p_id, String app_time, String p_name) {
		super();
		this.app_id = app_id;
		this.app_state = app_state;
		this.p_id = p_id;
		this.app_time = app_time;
		this.p_name = p_name;
	}

	public Appointment_Table(String sc_id, String app_state, String p_id, String app_time, String doc_date,
			String doc_time, String doc_name, String p_name, String doc_dept) {
		super();
		this.sc_id = sc_id;
		this.app_state = app_state;
		this.p_id = p_id;
		this.app_time = app_time;
		this.doc_date = doc_date;
		this.doc_time = doc_time;
		this.doc_name = doc_name;
		this.p_name = p_name;
		this.doc_dept = doc_dept;
	}

	public Appointment_Table(String app_id, String sc_id, String app_state, String p_id, String app_time,
			String doc_date, String doc_time, String doc_name, String p_name, String doc_dept) {
		super();
		this.app_id = app_id;
		this.sc_id = sc_id;
		this.app_state = app_state;
		this.p_id = p_id;
		this.app_time = app_time;
		this.doc_date = doc_date;
		this.doc_time = doc_time;
		this.doc_name = doc_name;
		this.p_name = p_name;
		this.doc_dept = doc_dept;
	}

	@Override
	public String toString() {
		return "Appointment_Table [app_id=" + app_id + ", sc_id=" + sc_id + ", app_state=" + app_state + ", p_id="
				+ p_id + ", app_time=" + app_time + ", doc_date=" + doc_date + ", doc_time=" + doc_time + ", doc_name="
				+ doc_name + ", p_name=" + p_name + ", doc_dept=" + doc_dept + "]";
	}

}
