package org.great.dao;

import java.util.ArrayList;
import java.util.List;

public interface BaseDao
{
	// ����
	public boolean insertObject(Object obj);

	// �޸�
	public boolean updateObject(Object obj);

	// ����id����
	public Object findById(String name);

	// ��������
	public ArrayList<Object> findAll();

	// ɾ��
	public boolean deleteObject(int id);

	// ��ҳ
	public ArrayList<Object> getPageList(int currentPage, int pageCount);
	
	//
	public ArrayList<Object> getPageList(int currentPage, int pageCount,String name ,String name1 );
}
