package org.great.dao;

import java.util.List;

import org.great.entity.Appointment_Table;

public interface AppointmentTableDao extends BaseDao {

	public List<Appointment_Table> findById(String c_id, String date);

	public List<Appointment_Table> findBydate_name(String name, String date, String dept);

	public Boolean updateyuyue(Appointment_Table appoin);

}
