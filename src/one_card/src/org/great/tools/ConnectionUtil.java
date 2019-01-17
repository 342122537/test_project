package org.great.tools;

import java.sql.Connection;
import java.sql.SQLException;

import javax.management.Query;

import org.apache.commons.dbutils.QueryRunner;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionUtil {
	
	public static Connection conn=null;
	public static ComboPooledDataSource dataSource = null;
	
	static {
		dataSource = new ComboPooledDataSource("myc3p0");
	}
	public static Connection getConnction() {
		
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return conn;
		
	}
	public static QueryRunner getQueryRunner() {
		QueryRunner queryRunner = new QueryRunner(dataSource);
		
		
		return queryRunner;
		
	}
	
	public static void main(String[] args) {
		
		System.out.println(getConnction());
	}
}
