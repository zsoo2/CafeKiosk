package com.cafekiosk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafekiosk.mapper.ManageMenuMapper;
import com.cafekiosk.model.ManageMenuVO;

@Service  
public class ManageMenuServiceImpl implements ManageMenuService{

	@Autowired
	ManageMenuMapper manageMenuMapper;

	@Override
	public void insertMenu(ManageMenuVO manageMenu) throws Exception {
		manageMenuMapper.insertMenu(manageMenu);
	}
	

}
