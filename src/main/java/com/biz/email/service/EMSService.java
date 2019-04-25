package com.biz.email.service;

import java.util.List;

import com.biz.email.model.EMSVO;

public interface EMSService {
	
	public List<EMSVO> selectAll();
	
	public EMSVO findById(long id);
	
	public int insert(EMSVO eVO);
	
	public int update(EMSVO eVO);
	
	public int delete(long id);



}
