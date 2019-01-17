package org.great.dao;

import java.util.List;

import org.great.entity.DoctorTable;

public interface DoctorTableDao extends BaseDao {

	public List<DoctorTable> findAlls();

	public List<DoctorTable> findbydept(String dept, String date1, String date2);
	public DoctorTable findbydae(String dept, String date1);

}
