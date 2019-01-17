package org.great.dao;

import org.great.entity.PatientTable;

public interface PatientTableDao extends BaseDao
{
	public Object findByc_Id(String  c_id) ;
	public boolean deleteid(String  c_id) ;
	

	public PatientTable getPatinetOldid(String id_sex, String old_id);
	public  boolean updateBalance(String c_id, String newBalnce) ;

}
