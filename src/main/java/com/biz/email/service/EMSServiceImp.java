package com.biz.email.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.biz.email.mapper.EMSDao;
import com.biz.email.model.EMSVO;

@Service
public class EMSServiceImp implements EMSService {

	@Autowired
	EMSDao eDao;
	
	@Override
	public List<EMSVO> selectAll() {
		// TODO Auto-generated method stub
		
		List<EMSVO> eList = eDao.selectAll();
		
		return eList;
	}

	@Override
	public EMSVO findById(long id) {
		// TODO Auto-generated method stub
		
		EMSVO eVO = eDao.findById(id);
		return eVO;
	}

	@Override
	public int insert(EMSVO eVO) {
		// TODO Auto-generated method stub
		
		int ret = eDao.insert(eVO);
		
		return ret;
	}

	@Override
	public int update(EMSVO eVO) {
		// TODO Auto-generated method stub
		return eDao.update(eVO);
	}

	@Override
	public int delete(long id) {
		// TODO Auto-generated method stub
		return eDao.delete(id);
	}

}
