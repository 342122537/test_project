package org.great.dao;

public class FactoryDao
{
	public static Object getObject(String className)
	{
		Object obj = null;

		try
		{
			Class cls = Class.forName(className);

			obj = cls.newInstance();
		} catch (InstantiationException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (ClassNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return obj;

	}
}
