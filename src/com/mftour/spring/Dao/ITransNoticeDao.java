	package com.mftour.spring.Dao;

import java.util.List;

import com.mftour.spring.model.TTransNotice;


public interface ITransNoticeDao {
	
	public void addOrUpdate(TTransNotice transnotice) throws Exception;
	public List<TTransNotice> queryTransNoticeByName(String username)
			throws Exception;

}
	 
	