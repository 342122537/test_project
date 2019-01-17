package org.great.entity;

public class WorksTable {
	String s_name;
	String sale_number;
	String chang_number;
	String exit_number;
	String add_number;
	String per_number;
	String dengji_number;
	String ctuifei_number;

	public WorksTable(String s_name, String sale_number, String chang_number, String exit_number, String add_number,
			String per_number, String dengji_number, String ctuifei_number) {
		super();
		this.s_name = s_name;
		this.sale_number = sale_number;
		this.chang_number = chang_number;
		this.exit_number = exit_number;
		this.add_number = add_number;
		this.per_number = per_number;
		this.dengji_number = dengji_number;
		this.ctuifei_number = ctuifei_number;
	}

	public WorksTable() {
		super();
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getSale_number() {
		return sale_number;
	}

	public void setSale_number(String sale_number) {
		this.sale_number = sale_number;
	}

	public String getChang_number() {
		return chang_number;
	}

	public void setChang_number(String chang_number) {
		this.chang_number = chang_number;
	}

	public String getExit_number() {
		return exit_number;
	}

	public void setExit_number(String exit_number) {
		this.exit_number = exit_number;
	}

	public String getAdd_number() {
		return add_number;
	}

	public void setAdd_number(String add_number) {
		this.add_number = add_number;
	}

	public String getPer_number() {
		return per_number;
	}

	public void setPer_number(String per_number) {
		this.per_number = per_number;
	}

	public String getDengji_number() {
		return dengji_number;
	}

	public void setDengji_number(String dengji_number) {
		this.dengji_number = dengji_number;
	}

	public String getCtuifei_number() {
		return ctuifei_number;
	}

	public void setCtuifei_number(String ctuifei_number) {
		this.ctuifei_number = ctuifei_number;
	}

	@Override
	public String toString() {
		return "WorksTable [s_name=" + s_name + ", sale_number=" + sale_number + ", chang_number=" + chang_number
				+ ", exit_number=" + exit_number + ", add_number=" + add_number + ", per_number=" + per_number
				+ ", dengji_number=" + dengji_number + ", ctuifei_number=" + ctuifei_number + "]";
	}

}
