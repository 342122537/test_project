package org.great.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDb
{
	private static Connection conn;
	private static String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static String USERNAME = "system";
	private static String UPASSWORD = "123456";

	public static Connection getConn()
	{

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(URL, USERNAME, UPASSWORD);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;

	}
	
	// public static void main(String[] args) {
	// System.out.println(MyDb.getConn());
	// }
}
