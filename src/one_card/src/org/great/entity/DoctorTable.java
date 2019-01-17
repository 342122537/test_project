package org.great.entity;

public class DoctorTable {
	String doc_id;
	String doc_date;
	String doc_name;
	String doc_dept;
	String xingqi;
	String s_id;
	String time;

	public DoctorTable(String doc_date, String doc_name, String doc_dept, String xingqi, String s_id, String time) {
		super();
		this.doc_date = doc_date;
		this.doc_name = doc_name;
		this.doc_dept = doc_dept;
		this.xingqi = xingqi;
		this.s_id = s_id;
		this.time = time;
	}

	public DoctorTable(String doc_id, String doc_date, String doc_name, String doc_dept, String xingqi, String s_id,
			String time) {
		super();
		this.doc_id = doc_id;
		this.doc_date = doc_date;
		this.doc_name = doc_name;
		this.doc_dept = doc_dept;
		this.xingqi = xingqi;
		this.s_id = s_id;
		this.time = time;
	}

	@Override
	public String toString() {
		return "DoctorTable [doc_id=" + doc_id + ", doc_date=" + doc_date + ", doc_name=" + doc_name + ", doc_dept="
				+ doc_dept + ", xingqi=" + xingqi + ", s_id=" + s_id + ", time=" + time + "]";
	}

	public DoctorTable() {
		super();
	}

	public String getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(String doc_id) {
		this.doc_id = doc_id;
	}

	public String getDoc_date() {
		return doc_date;
	}

	public void setDoc_date(String doc_date) {
		this.doc_date = doc_date;
	}

	public String getDoc_name() {
		return doc_name;
	}

	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}

	public String getDoc_dept() {
		return doc_dept;
	}

	public void setDoc_dept(String doc_dept) {
		this.doc_dept = doc_dept;
	}

	public String getXingqi() {
		return xingqi;
	}

	public void setXingqi(String xingqi) {
		this.xingqi = xingqi;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
